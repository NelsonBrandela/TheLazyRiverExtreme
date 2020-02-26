//
//  ScoringSystem.swift
//  LazyRiverExtreme
//
//  Created by Nathanial Anthony Joshua Mentis on 2020-02-16.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation

enum ScoreName{
   case Kills = 0, Distance, Time
}

struct Score{
    var points: Float = 0
    var scoreMultiplier: Float = 1.25
    private var score: Float = 0
    //Updates score and returns it
    func GetScore() -> Float{
        score = points * scoreMultiplier
        return score
    }
}

class ScoringSystem
{
    //Core variables
    var overallScore: Float = 0
    //Point specific variables
    private var killScore: Score = Score()
    private var distScore: Score = Score()
    private var timeScore: Score = Score()
    
    init(startingScore: Float = 0)
    {
        score = startingScore
        
    }
    
    
    private func UpdateScore(elapsedTime: Float){
        overallScore += distScore.GetScore()/elapsedTime + killScore.GetScore() + timeScore.GetScore()
    }
    
    private func AddPoints(scoreName: ScoreName, points: Float){
        switch scoreName{
            case ScoreName.Kills:
                killScore.points += points
            case ScoreName.Distance:
                distScore.points += points
            case ScoreName.Time:
                timeScore.points += points
        default:
           print("Failed to add points")
        }
    }
    
    func GetScore(scoreName: ScoreName) -> Score?
    {
        switch scoreName{
            case ScoreName.Kills:
                return killScore
            case ScoreName.Distance:
                return distScore
            case ScoreName.Time:
                return timeScore
        default:
           print("Failed to retrieve requested score")
            var fail: Score?
            return fail
        }
    }
    
    func SetMultiplierForAll(newValue: Float){
        killScore.scoreMultiplier = newValue
        distScore.scoreMultiplier = newValue
        timeScore.scoreMultiplier = newValue
    }
    
}
