//
//  AssetLoader.swift
//  LazyRiverExtreme
//
//  Created by Brandon MacLean on 2020-03-09.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation
import Firebase

let storage = Storage.storage()
let storageRef = storage.reference()

let charSet1 = storage.reference(forURL: "https://console.firebase.google.com/project/thelazyriverextreme/storage/thelazyriverextreme.appspot.com/Characters/CharacterSet1.png")

let charSet2 = storage.reference(forURL: "https://console.firebase.google.com/project/thelazyriverextreme/storage/thelazyriverextreme.appspot.com/Characters/CharSet2.png")

let charSet3 = storage.reference(forURL: "https://console.firebase.google.com/project/thelazyriverextreme/storage/thelazyriverextreme.appspot.com/Characters/CharSet3.png")


//let backgroundImage = URL(string: "pathtoimage")!

let ref = charSet1.child(<#T##path: String##String#>)

let metaDataJPG = StorageMetadata()

func InitAssetLoader(){
    metaDataJPG.contentType = "image/jpeg"

    let uploadTask = storageRef.putFile(from: localFile, metadata: metaDataJPG)
    
    
    
}

