//
//  Workout_AppApp.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import SwiftUI
import SwiftData

@main
struct Workout_AppApp: App {
    let container: ModelContainer = DataModel.shared.modelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
    }
}
