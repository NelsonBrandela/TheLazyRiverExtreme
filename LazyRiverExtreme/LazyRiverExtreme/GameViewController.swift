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
 /*var handle :NSObjectProtocol = Auth.auth().addStateDidChangeListener { (auth, user) in
   // ...
 }*/
     var myImg:UIImage?
     var charSet1Img: UIImage?
     var charSet2Img: UIImage?
     var charSet3Img: UIImage?
    
     var enemyIdling: UIImage?
     var enemyAttacking: UIImage?
     var enemyDying: UIImage?
     var enemyProjectile: UIImage?
    
    var background1 : UIImage?
    var background2 : UIImage?
    var background3 : UIImage?
    // var
    
    var foreGround1 : UIImage?
    var foreGround2 : UIImage?
    var forGround3 : UIImage?
    override func viewDidLoad() {

        
        let dbRef = Database.database().reference()
        //Database references to files
        let imgRefs = dbRef.child("images/characterset2/url")
        let char1Ref = dbRef.child("images/charset1/url")
        let charSet3 = dbRef.child("images/characterset3/url")
        
        let enemyIdle = dbRef.child("images/Enemies/enemyidle")
        let enemyDead = dbRef.child("images/Enemies/enemydead")
        let enemyAttack = dbRef.child("images/Enemies/enemyattack")
        let enemyProjectile = dbRef.child("images/Enemies/enemyprojectile")
        
        let background1 = dbRef.child("images/Enemies/background1")
        let background2 = dbRef.child("images/Enemies/background2")
        let background3 = dbRef.child("images/Enemies/background3")
        
        
        char1Ref.observeSingleEvent(of: .value, with: {snapshot in
        if !snapshot.exists() {return}
        let imgInfo = snapshot.value as! String
            print(imgInfo)
            let storageRef = Storage.storage().reference(withPath: imgInfo)
                                            storageRef.downloadURL(completion: {(url,error) in    })
                                            storageRef.getData(maxSize: (1 * 1024 * 1024), completion: {(data, error) in
                                                if let _error = error{
                                                    print(_error)
                                                }
                                                else{
                                                    if let _data = data {
                                                      self.charSet1Img = UIImage(data: _data)
                                                        print("success")
                                                    }
                                                }
                                                
                                            })
        })
        charSet3.observeSingleEvent(of: .value, with: {snapshot in
               if !snapshot.exists() {return}
               let imgInfo = snapshot.value as! String
                   print(imgInfo)
            let storageRef = Storage.storage().reference(withPath: imgInfo)
                                                   storageRef.downloadURL(completion: {(url,error) in    })
                                                   storageRef.getData(maxSize: (1 * 1024 * 1024), completion: {(data, error) in
                                                       if let _error = error{
                                                           print(_error)
                                                       }
                                                       else{
                                                           if let _data = data {
                                                             self.charSet3Img = UIImage(data: _data)
                                                               print("success")
                                                           }
                                                       }
                                                       
                                                   })})
        
        enemyIdle.observeSingleEvent(of: .value, with: {snapshot in
                      if !snapshot.exists() {return}
                      let imgInfo = snapshot.value as! String
                          print(imgInfo)
            let storageRef = Storage.storage().reference(withPath: imgInfo)
                                            storageRef.downloadURL(completion: {(url,error) in    })
                                            storageRef.getData(maxSize: (1 * 1024 * 1024), completion: {(data, error) in
                                                if let _error = error{
                                                    print(_error)
                                                }
                                                else{
                                                    if let _data = data {
                                                      self.enemyIdling = UIImage(data: _data)
                                                        print("success")
                                                    }
                                                }
                                                
                                            })
        })
        enemyAttack.observeSingleEvent(of: .value, with: {snapshot in
                             if !snapshot.exists() {return}
                             let imgInfo = snapshot.value as! String
                                 print(imgInfo)
            let storageRef = Storage.storage().reference(withPath: imgInfo)
                                            storageRef.downloadURL(completion: {(url,error) in    })
                                            storageRef.getData(maxSize: (1 * 1024 * 1024), completion: {(data, error) in
                                                if let _error = error{
                                                    print(_error)
                                                }
                                                else{
                                                    if let _data = data {
                                                      self.enemyAttacking = UIImage(data: _data)
                                                        print("success")
                                                    }
                                                }
                                                
                                            })
        })
        
        
        enemyDead.observeSingleEvent(of: .value, with: {snapshot in
                             if !snapshot.exists() {return}
                             let imgInfo = snapshot.value as! String
                                 print(imgInfo)
            let storageRef = Storage.storage().reference(withPath: imgInfo)
                                            storageRef.downloadURL(completion: {(url,error) in    })
                                            storageRef.getData(maxSize: (1 * 1024 * 1024), completion: {(data, error) in
                                                if let _error = error{
                                                    print(_error)
                                                }
                                                else{
                                                    if let _data = data {
                                                      self.enemyDying = UIImage(data: _data)
                                                        print("success")
                                                    }
                                                }
                                                
                                            })
        })
        enemyProjectile.observeSingleEvent(of: .value, with: {snapshot in
                             if !snapshot.exists() {return}
                             let imgInfo = snapshot.value as! String
                                 print(imgInfo)
            let storageRef = Storage.storage().reference(withPath: imgInfo)
                                            storageRef.downloadURL(completion: {(url,error) in    })
                                            storageRef.getData(maxSize: (1 * 1024 * 1024), completion: {(data, error) in
                                                if let _error = error{
                                                    print(_error)
                                                }
                                                else{
                                                    if let _data = data {
                                                      self.enemyProjectile = UIImage(data: _data)
                                                        print("success")
                                                    }
                                                }
                                                
                                            })
            
        })
        background1.observeSingleEvent(of: .value, with: {snapshot in
                             if !snapshot.exists() {return}
                             let imgInfo = snapshot.value as! String
                                 print(imgInfo)
            let storageRef = Storage.storage().reference(withPath: imgInfo)
                                            storageRef.downloadURL(completion: {(url,error) in    })
                                            storageRef.getData(maxSize: (1 * 1024 * 1024), completion: {(data, error) in
                                                if let _error = error{
                                                    print(_error)
                                                }
                                                else{
                                                    if let _data = data {
                                                      self.background1 = UIImage(data: _data)
                                                        print("success")
                                                    }
                                                }
                                                
                                            })
            
        })
        
        background2.observeSingleEvent(of: .value, with: {snapshot in
                             if !snapshot.exists() {return}
                             let imgInfo = snapshot.value as! String
                                 print(imgInfo)
            let storageRef = Storage.storage().reference(withPath: imgInfo)
                                            storageRef.downloadURL(completion: {(url,error) in    })
                                            storageRef.getData(maxSize: (1 * 1024 * 1024), completion: {(data, error) in
                                                if let _error = error{
                                                    print(_error)
                                                }
                                                else{
                                                    if let _data = data {
                                                      self.background2 = UIImage(data: _data)
                                                        print("success")
                                                    }
                                                }
                                                
                                            })
            
        })
        
        background3.observeSingleEvent(of: .value, with: {snapshot in
                             if !snapshot.exists() {return}
                             let imgInfo = snapshot.value as! String
                                 print(imgInfo)
            let storageRef = Storage.storage().reference(withPath: imgInfo)
                                            storageRef.downloadURL(completion: {(url,error) in    })
                                            storageRef.getData(maxSize: (1 * 1024 * 1024), completion: {(data, error) in
                                                if let _error = error{
                                                    print(_error)
                                                }
                                                else{
                                                    if let _data = data {
                                                      self.background3 = UIImage(data: _data)
                                                        print("success")
                                                    }
                                                }
                                                
                                            })
        })
        
        
              imgRefs.observeSingleEvent(of: .value, with: {snapshot in
                  if !snapshot.exists() {return}
                  let imgInfo = snapshot.value as! String
                  print(imgInfo)
                let storageRef = Storage.storage().reference(withPath: imgInfo)
                                 storageRef.downloadURL(completion: {(url,error) in    })
                                 storageRef.getData(maxSize: (1 * 1024 * 1024), completion: {(data, error) in
                                     if let _error = error{
                                         print(_error)
                                     }
                                     else{
                                         if let _data = data {
                                           self.myImg = UIImage(data: _data)
                                             print("success")
                                         }
                                     }
                                     
                                 })
                              //   let imgurl = imgInfo["IMGPicURL"] as! String
                               //  print(imgurl)
                             })
                  //start
              /* if (Auth.auth().currentUser == nil)
                {
                    Auth.auth().signInAnonymously(completion:{(user, error) in
                        
                        
                    }
                }*/
               /* if Auth.auth().currentUser == nil {
                    /*  Auth.auth().signInAnonymously(completion: { (user , error) in
                          if let error = error {
                           let error = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                            
                            /*let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
                              alert.addAction(ok)
                              self.present(alert, animated: true, completion: nil)*/
                          }
                      })*/
                  }*/
                  //end
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
    
   /* override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          // ...
        }

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle)
    }*/
}
