//
//  WorkoutExercise.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftData
import SwiftUI

@Model
class WorkoutExercise {
    var id = UUID()
    var order: Int // Order in Workout
    var notes: String?
    var supersetNumber: Int?

    @Relationship(deleteRule: .cascade) var sets: [ExerciseSet]
    @Relationship(deleteRule: .nullify) var workout: Workout
    @Relationship(deleteRule: .nullify) var exercise: Exercise
    
    init(id: UUID = UUID(), order: Int, notes: String? = nil, supersetNumber: Int? = nil, sets: [ExerciseSet] = [], workout: Workout, exercise: Exercise) {
        self.id = id
        self.order = order
        self.notes = notes
        self.supersetNumber = supersetNumber
        self.sets = sets
        self.workout = workout
        self.exercise = exercise
    }
}

extension WorkoutExercise {
    var superSetColor: Color {
        if let supersetNumber, !DEFAULT_SUPER_SET_COLORS.isEmpty {
            let index = supersetNumber % DEFAULT_SUPER_SET_COLORS.count
            return DEFAULT_SUPER_SET_COLORS[index]
        } else {
            return .clear
        }
    }
}
