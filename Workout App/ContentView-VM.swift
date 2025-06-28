//
//  ContentView-VM.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftUI

extension ContentView {
    @Observable
    class ViewModel {
        var selectedTab: Int = {
            if UserDefaults.standard.object(forKey: "selectedTab") == nil {
                return 3
            }
            return UserDefaults.standard.integer(forKey: "selectedTab")
        }() {
            didSet {
                UserDefaults.standard.set(selectedTab, forKey: "selectedTab")
            }
        }
        
        // Workout Tab
        var workoutPath = NavigationPath()
        var currentWorkout: Workout?
        var skipSwiftDataCurrentWorkout = false // For when overwritting existing workout and starting one quickly before Swift Data actually deletes it (save isn't working idk)
        
        // Exercise Tab
        var exercisePath = NavigationPath()
        var equipmentType: EquipmentType?
        var muscleType: MuscleType?
        var sortType: ExerciseSortType = .nameAscending
    }
}
