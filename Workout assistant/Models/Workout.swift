//
//  Workout.swift
//  Workout assistant
//
//  Created by Vyacheslav on 20.11.2019.
//  Copyright © 2019 jonyvee. All rights reserved.
//

import Foundation

public struct Workout: Equatable, Codable {
    
    private var id: Int
    var name: String
    var exercises: [Exercise]
    
    init(name: String, exercises: [Exercise]) {
        self.id = UserDefaults.standard.integer(forKey: "lastWorkoutId") + 1
        UserDefaults.standard.setValue(self.id, forKey: "lastWorkoutId")
        self.name = name
        self.exercises = exercises
    }
    
    public static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.id == rhs.id
    }
    
}
