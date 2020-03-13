//
//  ChargerEnemy.swift
//  LazyRiverExtreme
//
//  Created by Jean-Francois Carnovale on 2020-03-12.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation
import SpriteKit

class ChargerEnemy : EnemyBase{
    var attack: Int
    
    var speed: Double
    
    var sprite: SKSpriteNode
    
    init(start: CGPoint, time: Double){
        let texture = SKTexture(imageNamed: "enemy")
        sprite = SKSpriteNode(texture: texture, color:.clear, size:texture.size())
        sprite.name = "Charger"
        sprite.position = start
        attack = 50
        speed = 1.0 * ((60.0 + time)/60.0)
        initPhysics()
    }
    
    func Collide() -> Int {
        sprite.removeFromParent()
        return attack
    }
    
    func initPhysics() {
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: (sprite.texture?.size().width ?? 200)/2)
        sprite.physicsBody?.affectedByGravity = false;
        sprite.physicsBody?.allowsRotation = false;
        sprite.physicsBody?.categoryBitMask = 1
        sprite.physicsBody?.collisionBitMask = 2
        sprite.physicsBody?.contactTestBitMask = 1
        sprite.physicsBody?.velocity.dx = CGFloat(-500 * speed)
    }
}
