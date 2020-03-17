//
//  Ability.swift
//  LazyRiverExtreme
//
//  Created by Jean-Francois Carnovale on 2020-02-13.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation

class Ability{
    var spriteImages : [String]
    var abilityID : CShort
    init(sprites: [String], ID: CShort){
        spriteImages = sprites
        abilityID = ID
    }
}
