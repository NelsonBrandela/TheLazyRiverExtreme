//
//  ITimer.swift
//  LazyRiverExtreme
//
//  Created by Nathanial Mentis on 2020-02-11.
//  Copyright © 2020 ArkedGames. All rights reserved.
//

import Foundation

protocol Timer{
    let currentTime;
    //Increment must be the same type as current time
    let increment;
    
    func StartTimer() -> Bool;
    func Stop() -> Bool;
    //Sets current time to designated value
    func Reset(value: Int) -> Bool;
}
