//
//  ITimer.swift
//  LazyRiverExtreme
//
//  Created by Nathanial Mentis on 2020-02-11.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation

class TimerClock{
    //Time variables\\
    //All in seconds\\
    let timeCreated: Double
    private var currentTimeElapsed: Double = 0.0 // Current timer elapesed time since start
    private var previousTimeElasped: Double = 0.0 // The count before the current
    var currentCount: Double = 0.0
    var deltaTime: Double = 0.0
    
    private var start: Double = 0.0 //The last time the timer was started
    
    var isCounting: Bool = false;
    
    private var updateLoop = Timer()
    
    
    init() {
        timeCreated = Date().timeIntervalSinceReferenceDate
        updateLoop = Timer.scheduledTimer(withTimeInterval: 1/60, repeats: true) {_ in
            Update()
        }
    }
    
    deinit{
        updateLoop.invalidate()
    }
    
    private func Update(){
        previousTimeElasped = currentTimeElapsed
        currentTimeElapsed = Date().timeIntervalSinceReferenceDate - start
        deltaTime = currentTimeElapsed - previousTimeElasped
        if(isCounting)
        {
            currentCount += deltaTime
        }
    }
    
    func Start(){
        start = Date().timeIntervalSinceReferenceDate
        isCounting = true
    }
    func Stop(){
        isCounting = false
    }
    //Sets current time to designated value
    func Reset(value: Double = 0.0){
        currentCount = value;
    }
}
