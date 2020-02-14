//
//  PlayerData.swift
//  LazyRiverExtreme
//
//  Created by Jean-Francois Carnovale on 2020-02-11.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation

class PlayerData{
    var highScore : Float
    var money : Float
    var premiumMoney : Float
    var lastSprites : [String]
    //keeping these as ints for now, the idea is to store the item key from the store and reference it
    var storeUnlocks: Set<CShort>
    var equipment: Set<CShort>
    var ability1: CShort
    var ability2: CShort
    var previousRuns: [Float]
    var abilities: [CShort: [String]] = [:]
    
    init(){
        //all of these values will be changed to get initialized from a file/cloud storage
        highScore = 0.0
        money = 0.0
        premiumMoney = 0.0
        storeUnlocks = Set<CShort>()
        equipment = Set<CShort>()
        ability1 = 0
        ability2 = 0
        lastSprites = [String]()
        previousRuns = [Float]()
        //abilities would get loaded here from file
    }
}


