//
//  History.swift
//  Workout assistant
//
//  Created by Vyacheslav on 20.11.2019.
//  Copyright © 2019 jonyvee. All rights reserved.
//

import Foundation

final class History {
    
    private init() {}
    
    public static func getWorkouts() -> [CompletedWorkout] {
        if let data = UserDefaults.standard.value(forKey: "history") as? Data {
            return (try? PropertyListDecoder().decode([CompletedWorkout].self, from: data)) ?? []
        }
        
        return []
    }
    
    public static func addWorkout(_ workout: CompletedWorkout) {
        var completedWorkouts = getWorkouts()
        completedWorkouts.append(workout)
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(completedWorkouts), forKey: "history")
    }
    
}
