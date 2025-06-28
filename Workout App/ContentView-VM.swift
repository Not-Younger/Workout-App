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
        var workoutPath = NavigationPath()
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
        
        // Exercise Tab
        var equipmentType: EquipmentType?
        var muscleType: MuscleType?
        var sortType: ExerciseSortType = .nameAscending
    }
}
