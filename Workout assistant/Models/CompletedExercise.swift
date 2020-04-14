//
//  CompletedExercise.swift
//  Workout assistant
//
//  Created by Vyacheslav on 20.11.2019.
//  Copyright © 2019 jonyvee. All rights reserved.
//

import Foundation

public struct CompletedExercise: Codable {
    
    let exercise: Exercise
    var steps: [Int]
    
    init(exercise: Exercise, steps: [Int] = []) {
        self.exercise = exercise
        self.steps = steps
    }
    
}
