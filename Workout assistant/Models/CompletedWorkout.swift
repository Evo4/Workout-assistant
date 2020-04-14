//
//  CompletedWorkout.swift
//  Workout assistant
//
//  Created by Vyacheslav on 20.11.2019.
//  Copyright © 2019 jonyvee. All rights reserved.
//

import Foundation

public struct CompletedWorkout: Codable {
    
    let workout: Workout
    var exercises: [CompletedExercise]
    let startDate: TimeInterval
    var endDate: TimeInterval = 0
    
    init(workout: Workout, startDate: TimeInterval, exercises: [CompletedExercise] = []) {
        self.workout = workout
        self.startDate = startDate
        self.exercises = exercises
    }
    
    public mutating func setEndDate(_ endDate: TimeInterval) {
        self.endDate = endDate
    }
    
}
