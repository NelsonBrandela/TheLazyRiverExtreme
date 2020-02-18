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
        health = 100.0
        speed = 1.0
        animationNames = [String]()
        savedData = PlayerData()
        lastAnimation = String()
        spriteImageNames = savedData.lastSprites
        startingPoint = start
        endingPoint = end
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
        let directionx = endingPoint.x - sprite.position.x
        let directiony = endingPoint.y - sprite.position.y
        let mag = sqrt((directionx * directionx) + (directiony * directiony))
       
        let move = SKAction.move(to:endingPoint, duration: Double(mag) / (200 * Double(speed)))
        
        sprite.removeAction(forKey: lastAnimation)
        
        sprite.run(move, withKey:"move")
        lastAnimation = "move"
    }
    
    func resetPosition(){
        let directionx = startingPoint.x - sprite.position.x
        let directiony = startingPoint.y - sprite.position.y
        let mag = sqrt((directionx * directionx) + (directiony * directiony))
       
        let reset = SKAction.move(to:startingPoint, duration: Double(mag) / (200 * Double(speed)))
        
        sprite.removeAction(forKey: lastAnimation)
        
        sprite.run(reset, withKey: "reset")
        lastAnimation = "reset"
    }
    
    func ability1(scene: SKScene){
        let projectile = SKSpriteNode(imageNamed: "cat")
        scene.addChild(projectile)
        projectile.zPosition = 1
        projectile.position = CGPoint(x:sprite.position.x, y:sprite.position.y)
        
        let forwardvec = CGVector(dx: cos(sprite.zRotation), dy: sin(sprite.zRotation))
        let projectilelaunch = SKAction.moveBy(x:forwardvec.dx * 500, y:forwardvec.dy * 500, duration: 1)
        let death = SKAction.removeFromParent()
        let sequence = SKAction.sequence([projectilelaunch, death])
        projectile.run(sequence)
    }
    
    func ability2(scene: SKScene){
        
    }
}
