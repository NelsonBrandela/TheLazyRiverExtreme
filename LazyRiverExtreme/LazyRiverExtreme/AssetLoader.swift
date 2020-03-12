//
//  AssetLoader.swift
//  LazyRiverExtreme
//
//  Created by Brandon MacLean on 2020-03-09.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation
import Firebase
import UIKit

//let storage = Storage.storage().reference(withPath: "images")
//let storageRef = storage.reference()



var ref : DatabaseReference!



//let backgroundImage = URL(string: "pathtoimage")!


//let charSetRef = charSet1.parent()?.child("CharacterSet1.jpg")

//let metaDataJPG = StorageMetadata()

var img : UIImageView?
//https://www.letsbuildthatapp.com/course_video?id=58


func InitAssetLoader(){
   
    ref.observeSingleEvent(of: .value, with: {
        snapshot in if !snapshot.exists() { return}
        
        let imageURL = snapshot.childSnapshot(forPath: "images/characterset1").value
            
        img?.load(url: imageURL as! URL)
        
        
    })
    
    
}
    
    
    
extension UIImageView {
    func load(url :URL)
    {
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image;
                    }
                }
            }
        }
    }
}


