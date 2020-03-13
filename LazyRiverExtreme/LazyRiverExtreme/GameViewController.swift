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
import FirebaseAuth
import FirebaseStorage
class GameViewController: UIViewController {

    override func viewDidLoad() {


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
              




        super.viewDidLoad()
        let scene = GameScene(size: CGSize(width: 2048, height: 1536))
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
