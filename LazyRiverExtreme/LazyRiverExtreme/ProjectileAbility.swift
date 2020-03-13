//
//  Projectile.swift
//  LazyRiverExtreme
//
//  Created by Jean-Francois Carnovale on 2020-03-12.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation
import SpriteKit

class ProjectileAbility: Ability{
    override func activate(scene: SKScene, player: Player) {
        let projectile = SKSpriteNode(imageNamed: "cat")
        projectile.physicsBody = SKPhysicsBody(circleOfRadius: (projectile.texture?.size().width ?? 200)/2)
        projectile.physicsBody?.affectedByGravity = false;
        projectile.physicsBody?.allowsRotation = false;
        projectile.physicsBody?.categoryBitMask = 2
        projectile.physicsBody?.contactTestBitMask = 1
        projectile.name = "cat"
        scene.addChild(projectile)
        projectile.zPosition = 1
        projectile.position = CGPoint(x:player.sprite.position.x, y:player.sprite.position.y)
        projectile.physicsBody?.velocity.dx = 500
        /*let forwardvec = CGVector(dx: cos(player.sprite.zRotation), dy: sin(player.sprite.zRotation))
        let projectilelaunch = SKAction.moveBy(x:forwardvec.dx * 500, y:forwardvec.dy * 500, duration: 10)
        let death = SKAction.removeFromParent()
        let sequence = SKAction.sequence([projectilelaunch, death])
        projectile.run(sequence)*/
    }
}
