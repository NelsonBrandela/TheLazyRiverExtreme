//
//  PlayerData.swift
//  LazyRiverExtreme
//
//  Created by Jean-Francois Carnovale on 2020-02-11.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation

class PlayerData{
    var highScore = Float()
    var money = Float()
    var premiumMoney = Float()
    
    //keeping these as ints for now, the idea is to store the item key from the store and reference it
    var storeUnlocks: Set<Int>
    var equipment: Set<Int>
    
    init(){
        highScore = 0.0
        money = 0.0
        premiumMoney = 0.0
        storeUnlocks = Set<Int>()
        equipment = Set<Int>()
    }
}


