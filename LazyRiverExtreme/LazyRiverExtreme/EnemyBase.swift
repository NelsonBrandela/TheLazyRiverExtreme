//
//  EnemyBase.swift
//  LazyRiverExtreme
//
//  Created by Jean-Francois Carnovale on 2020-03-12.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation
import SpriteKit

protocol EnemyBase {
    var attack: Int{get}
    var speed: Double{get}
    var sprite: SKSpriteNode{get set}
    func Collide() -> Int
}
