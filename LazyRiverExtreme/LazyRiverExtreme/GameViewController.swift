//
//  GameViewController.swift
//  LazyRiverExtreme
//
//  Created by Jean-Francois Carnovale on 2020-01-21.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import Firebase
import FirebaseStorage
import Foundation

class GameViewController: UIViewController {
  // @IBOutlet weak var imageView: UIImageView!
 
   
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
           let dbRef = Database.database().reference()
         let imgRefs = dbRef.child("images/characterset2/url")
        
        imgRefs.observeSingleEvent(of: .value, with: {snapshot in
            if !snapshot.exists() {return}
            let imgInfo = snapshot.value as! String
            print(imgInfo)
            
            //start
          /* if Auth.auth().currentUser == nil {
                Auth.auth().signInAnonymously(completion: { (user: User?, error: Error?) in
                    if let error = error {
                        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                        alert.addAction(ok)
                        self.present(alert, animated: true, completion: nil)
                    }
                })
            }*/
            //end
            
            let storageRef = Storage.storage().reference(withPath: imgInfo)
            storageRef.downloadURL(completion: {(url,error) in    })
            storageRef.getData(maxSize: (1 * 1024 * 1024), completion: {(data, error) in
                if let _error = error{
                    print(_error)
                }
                else{
                    if let _data = data {
                        let myImg:UIImage! = UIImage(data: _data)
                        print("success")
                    }
                }
                
            })
               
                
                
           
         //   let imgurl = imgInfo["IMGPicURL"] as! String
          //  print(imgurl)
            
        })
        
        
        //let imageData = try! Data(contentsOf: url)
       // let image = UIImage(data: imageData)
        
     //   lry dbRef = Database.database().reference().child("images/character1");
       /* dbRef.observeSingleEvent(of: .value, with: {(snapshot) in
            let downloadURL = snapshot.value as! String
            let storageRef = self.storageReference.storage.reference(forURL:downloadURL)
            
            storageRef.getData(maxSize: 1 * 1024 * 1024) { completion;: (Dataerror) Void in
                
                
            })*/

        //})
    
      // let url = dbRef.child("images/character1").observeSingleEvent(of: .value, //with: {snapshot in
         //   let value = snapshot.value as? NSDictionary
         //   let image1 = value?["character1"] as? String
          
          //  let UIImageView : UIImageView = self.imageView
          //  let PlaceHolderImage = UIImage(named :"Placeholder.jpg")
            
            
         //   UIImageView.setimage
      //  })
        
     
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
