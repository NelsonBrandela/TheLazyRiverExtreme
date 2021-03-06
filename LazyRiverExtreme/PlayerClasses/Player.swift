//
//  Player.swift
//  LazyRiverExtreme
//
//  Created by Jean-Francois Carnovale on 2020-02-11.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation
import SpriteKit

class Player {

    var sprite : SKSpriteNode
    var health : Float
    var speed : Float
    var animationNames : [String]
    var savedData : PlayerData
    var lastAnimation: String
    var spriteImageNames : [String]
    var startingPoint : CGPoint
    var endingPoint:CGPoint
    
    init(start: CGPoint, end: CGPoint){
        let texture = SKTexture(imageNamed: "zombie1")
        sprite = SKSpriteNode(texture: texture, color:.clear, size:texture.size())
        sprite.name = "Player"
        health = 100.0
        speed = 1.0
        animationNames = [String]()
        savedData = PlayerData()
        lastAnimation = String()
        spriteImageNames = savedData.lastSprites
        startingPoint = start
        endingPoint = end
        initPhysics()
    }
    
    func idleAnimation(){
        var spritetextures = [SKTexture]()
        for name in spriteImageNames{
            spritetextures.append(SKTexture(imageNamed: name))
        }
        
        //temporary
        spritetextures.append(sprite.texture!)
        
        let idle = SKAction.animate(with:spritetextures, timePerFrame: 0.5/Double(spritetextures.count))
        let reverse = idle.reversed()
        
        let sequence = SKAction.sequence([idle, reverse])
        
        let repeatsequence = SKAction.repeatForever(sequence)
        
        sprite.removeAction(forKey: lastAnimation)
        
        sprite.run(repeatsequence, withKey:"idle")
        lastAnimation = "idle"
    }
    
    func move(){
        /*let move = SKAction.move(by: CGVector(dx: 0, dy: 50), duration: 0.2)
        //will maybe add a unique moving animation action here
        let repeatmove = SKAction.repeatForever(move)*/
        /*let directionx = endingPoint.x - sprite.position.x
        let directiony = endingPoint.y - sprite.position.y
        let mag = sqrt((directionx * directionx) + (directiony * directiony))
       
        let move = SKAction.move(to:endingPoint, duration: Double(mag) / (200 * Double(speed)))
        
        sprite.removeAction(forKey: lastAnimation)
        
        sprite.run(move, withKey:"move")
        lastAnimation = "move"*/
        sprite.physicsBody?.velocity = CGVector(dx: 0, dy: Int(500 * speed))
    }
    
    func resetPosition(){
       /* let directionx = startingPoint.x - sprite.position.x
        let directiony = startingPoint.y - sprite.position.y
        let mag = sqrt((directionx * directionx) + (directiony * directiony))
       
        let reset = SKAction.move(to:startingPoint, duration: Double(mag) / (200 * Double(speed)))
        
        sprite.removeAction(forKey: lastAnimation)
        
        sprite.run(reset, withKey: "reset")
        lastAnimation = "reset"*/
        sprite.physicsBody?.velocity = CGVector(dx:0, dy:Int(-500 * speed))
    }
    
    func ability1(scene: SKScene){
        /*let projectile = SKSpriteNode(imageNamed: "cat")
        projectile.physicsBody = SKPhysicsBody(circleOfRadius: (sprite.texture?.size().width ?? 200)/2)
        projectile.physicsBody?.affectedByGravity = false;
        projectile.physicsBody?.allowsRotation = false;
        projectile.physicsBody?.categoryBitMask = 2
        projectile.physicsBody?.contactTestBitMask = 1
        projectile.name = "cat"
        scene.addChild(projectile)
        projectile.zPosition = 1
        projectile.position = CGPoint(x:sprite.position.x, y:sprite.position.y)
        
        let forwardvec = CGVector(dx: cos(sprite.zRotation), dy: sin(sprite.zRotation))
        let projectilelaunch = SKAction.moveBy(x:forwardvec.dx * 500, y:forwardvec.dy * 500, duration: 1)
        let death = SKAction.removeFromParent()
        let sequence = SKAction.sequence([projectilelaunch, death])
        projectile.run(sequence)*/
        
        let ability = ProjectileAbility(sprites: [String](), ID: 0)
        ability.activate(scene: scene, player: self)
    }
    
    func ability2(scene: SKScene){
        let ability = HealingAbility(sprites: [String](), ID: 0)
        ability.activate(scene: scene, player: self)
    }
    
    deinit {
        print("Destroying instance of Player")
    }
    
    func initPhysics(){
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: (sprite.texture?.size().width ?? 200)/2)
        sprite.physicsBody?.affectedByGravity = true;
        sprite.physicsBody?.allowsRotation = false;
        sprite.physicsBody?.collisionBitMask = 1;
        sprite.physicsBody?.contactTestBitMask = 1;
        sprite.physicsBody?.categoryBitMask = 0;
        sprite.physicsBody?.restitution = 2
    }
    
    func tookDamage(amount: Float){
        health -= amount
        print(health)
        if health <= 0 {
            sprite.removeFromParent()
        }
    }
}
