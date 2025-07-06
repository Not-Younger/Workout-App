//
//  WorkoutExerciseNote.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftData
import SwiftUI

@Model
class WorkoutExerciseNote {
    var id = UUID()
    var text: String
    var order: Int

    @Relationship(deleteRule: .nullify) var workoutExercise: WorkoutExercise
    
    init(text: String, order: Int, workoutExercise: WorkoutExercise) {
        self.text = text
        self.order = order
        self.workoutExercise = workoutExercise
    }
}
