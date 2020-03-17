//
//  HealingAbility.swift
//  LazyRiverExtreme
//
//  Created by Jean-Francois Carnovale on 2020-03-12.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation
import SpriteKit

class HealingAbility: Ability{
    override func activate(scene: SKScene, player: Player) {
        let heal = SKSpriteNode(imageNamed: "cat")
        heal.position = player.sprite.position
        scene.addChild(heal)
        heal.zPosition = 2
        player.health += 20
        if(player.health > 100){
            player.health = 100
        }
    }
}
