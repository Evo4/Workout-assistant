//
//  Workouts.swift
//  Workout assistant
//
//  Created by Vyacheslav on 20.11.2019.
//  Copyright © 2019 jonyvee. All rights reserved.
//

import Foundation

final class Workouts {
    
    private init() {}
    
    // Gym days
    public static func setGymDays(_ days: [DayOfWeek]) {
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(days), forKey: "gymDays")
    }
    
    public static func getGymDays() -> [DayOfWeek] {
        if let data = UserDefaults.standard.value(forKey:"gymDays") as? Data {
            return (try? PropertyListDecoder().decode([DayOfWeek].self, from: data)) ?? []
        }
        
        return []
    }
    
    // Workouts
    public static func addWorkout(_ workout: Workout) {
        var workouts = getWorkouts()
        workouts.append(workout)
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(workouts), forKey: "workouts")
    }
    
    public static func getWorkouts() -> [Workout] {
        if let data = UserDefaults.standard.value(forKey:"workouts") as? Data {
            return (try? PropertyListDecoder().decode([Workout].self, from: data)) ?? []
        }
        
        return []
    }
    
    public static func deleteWorkout(_ workout: Workout) {
        var workouts = getWorkouts()
        
        var i = 0
        for savedWorkout in workouts {
            if savedWorkout == workout {
                workouts.remove(at: i)
            }
            i += 1
        }
        
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(workouts), forKey: "workouts")
    }
    
    // Exercises
    public static func getLastMeasForExercise(_ exercise: Exercise) -> Int {
        return UserDefaults.standard.integer(forKey: "lastMeasFor" + String(exercise.id))
    }
    
    public static func setLastMeasForExercise(_ exercise: Exercise, meas: Int) {
        UserDefaults.standard.set(meas, forKey: "lastMeasFor" + String(exercise.id))
    }
    
}
