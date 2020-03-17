//
//  ScoringSystem.swift
//  LazyRiverExtreme
//
//  Created by Nathanial Anthony Joshua Mentis on 2020-02-16.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation

class ScoringSystem
{
    //Core variables
    var score: Int = 0
    private var scoreMultiplier: Int = 1
    
    //Point gain specific variables
    var killScore = 0
    var distanceScore = 0
    var timeScore = 0
    var pointsPerKill: Int
    var pointsPerDistanceMetric: Int
    var pointsPerTimeScale: Int
    
    init(startingScore: Int = 0,
         pointsGainedPerKill: Int = 1,
         pointsGainedPerDistanceMetric: Int = 1,
         pointsGainedPerTimeScale: Int = 1)
    {
        pointsPerKill = pointsGainedPerKill
        pointsPerDistanceMetric = pointsGainedPerDistanceMetric
        pointsPerTimeScale = pointsGainedPerTimeScale
        
    }
    
    //
    func UpdateScore(killsAquired: Int, distanceTravelled: Int, roundTimeElapsed: Int){
        UpdateKillScore(kills: killsAquired)
        UpdateDistanceScore(distanceTravelled: distanceTravelled)
        UpdateTimeScore(deltaTime: roundTimeElapsed)
        
        score = (killScore + distanceScore + timeScore) * scoreMultiplier
    }
    
    private func UpdateKillScore(kills: Int){
        //Do not use multiplier in this method
        //Get kills made this round
        
        //Add to kill counter(If there isn't one in another class make one)
        
        //Multiply kills by pointsPerKill
        killScore = kills * pointsPerKill
    }
    
    private func UpdateDistanceScore(distanceTravelled: Int){
        //Do not use multiplier in this method
        //Get distance travelled this round
        
        //Add to distance counter(If there isn't one in another class make one)
        
        //Multiply distance by pointsPerDistanceMetric
        distanceScore = distanceTravelled * pointsPerDistanceMetric
    }
    
    private func UpdateTimeScore(deltaTime: Int){
        //Do not use multiplier in this method
        //Get delta time for this round
        
        //Multiply dt by pointsPerTimeScale
        timeScore = deltaTime * pointsPerTimeScale;
    }
    
    func SetScoreMultiplier(newValue: Int){
        scoreMultiplier = newValue
    }
    
    func GetScoreMultiplier()->Int{
        return scoreMultiplier
    }
}
