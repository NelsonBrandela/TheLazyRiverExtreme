//
//  ColliderProtocol.swift
//  LazyRiverExtreme
//
//  Created by Jean-Francois Carnovale on 2020-03-12.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation
import SpriteKit

protocol Collider {
    func Collide(otherSprite: SKSpriteNode)
}
