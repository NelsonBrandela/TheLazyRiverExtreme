//
//  GameScene.swift
//  LazyRiverExtreme
//
//  Created by Jean-Francois Carnovale on 2020-01-21.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    let player = Player(start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: 0.0, y: 0.0))
    var held = false;
    let enemy = ChargerEnemy(start: CGPoint(x: 0, y:0), time: 0.0)
    
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        backgroundColor = SKColor.black
        //WILL BE IMPLEMENTING BACKGROUND STUFF AFTER WE HAVE ASSETS
        let background = SKSpriteNode(imageNamed: "background1")
        background.position = CGPoint(x:size.width/2, y:size.height/2)
        player.startingPoint = CGPoint(x:400, y:400)
        player.endingPoint = CGPoint(x: 400, y:size.height - 400)
        player.sprite.position = player.startingPoint
        addChild(background)
        addChild(player.sprite)
        player.sprite.zPosition = 1
        enemy.sprite.position = CGPoint(x: size.width - 200, y:size.height/2)
        addChild(enemy.sprite)
        enemy.sprite.zPosition = 1
        var splinePoints = [CGPoint(x: 0, y: 200),
                            CGPoint(x: size.width, y: 200)]
        let ground = SKShapeNode(splinePoints: &splinePoints, count: splinePoints.count)
        addChild(ground)
        ground.physicsBody = SKPhysicsBody(edgeChainFrom: ground.path!)
        ground.physicsBody?.categoryBitMask = 1
        ground.physicsBody?.contactTestBitMask = 1
        var splinePoints2 = [CGPoint(x: 0, y: size.height - 200),
                            CGPoint(x: size.width, y: size.height - 200)]
        let ground2 = SKShapeNode(splinePoints: &splinePoints2, count: splinePoints2.count)
        addChild(ground2)
        ground2.physicsBody = SKPhysicsBody(edgeChainFrom: ground2.path!)
        ground2.physicsBody?.categoryBitMask = 1
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let touchLoc = touch.location(in: self)
            if((touchLoc.x < (player.sprite.position.x + 50)) && (touchLoc.x > (player.sprite.position.x - 50))){
                if((touchLoc.y < (player.sprite.position.y + 50)) && (touchLoc.y > (player.sprite.position.y - 50))){
                    player.ability1(scene: self)
                }else{
                    held = true
                    //player.move()
                    //player.sprite.physicsBody?.velocity.dy = 1000
                }
            }else{
                //player.sprite.physicsBody?.velocity.dy = 1000
                //player.move()
                held = true
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //player.resetPosition()
        held = false
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if(held){
            player.move()
        }else{
            player.resetPosition()
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "Player" {
            if contact.bodyB.node?.name == "Charger"{
                player.tookDamage(amount: Float(enemy.Collide()))
            }
            //contact.bodyA.node?.removeFromParent()
        }
        if contact.bodyB.node?.name == "Player"{
            if contact.bodyA.node?.name == "Charger"{
            //contact.bodyB.node?.removeFromParent()
                player.tookDamage(amount: Float(enemy.Collide()))
            }
        }
        
        if contact.bodyA.node?.name == "Charger"{
            if contact.bodyB.node?.name == "cat"{
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
        }
        
        if contact.bodyB.node?.name == "Charger"{
            if contact.bodyA.node?.name == "cat"{
                contact.bodyA.node?.removeFromParent()
                contact.bodyB.node?.removeFromParent()
            }
        }
    }
}
