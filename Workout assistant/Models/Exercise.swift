//
//  Exercise.swift
//  Workout assistant
//
//  Created by Vyacheslav on 20.11.2019.
//  Copyright © 2019 jonyvee. All rights reserved.
//

import Foundation

public struct Exercise: Equatable, Codable {
    
    var id: Int
    var name: String
    var useTimer: Bool
    var reps: Int?
    var minutes: Int?
    
    init(name: String,reps: Int) {
        self.name = name
        self.reps = reps
        self.useTimer = false
        self.id = UserDefaults.standard.integer(forKey: "lastExerciseId") + 1
        UserDefaults.standard.setValue(self.id, forKey: "lastExerciseId")
    }
    
    init(name: String, minutes: Int) {
        self.name = name
        self.minutes = minutes
        self.useTimer = true
        self.id = UserDefaults.standard.integer(forKey: "lastExerciseId") + 1
        UserDefaults.standard.setValue(self.id, forKey: "lastExerciseId")
    }
    
    public static func == (lhs: Exercise, rhs: Exercise) -> Bool {
        return lhs.name == rhs.name
            && lhs.useTimer == rhs.useTimer
            && lhs.reps == rhs.reps
            && lhs.minutes == rhs.minutes
    }
    
}
