//
//  Set.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftData
import SwiftUI

enum SetType: String, Codable {
    case warmup, normal, dropSet, failure
}

@Model
class ExerciseSet {
    var id = UUID()
    var weight: Double?
    var reps: Int?
    var duration: TimeInterval?  // For time-based exercises
    var type: SetType
    var order: Int  // Order in the exercise
    

    @Relationship(deleteRule: .nullify) var exercise: Exercise
    @Relationship(deleteRule: .nullify) var workoutExercise: WorkoutExercise
    
    init(id: UUID = UUID(), weight: Double? = nil, reps: Int? = nil, duration: TimeInterval? = nil, type: SetType, order: Int, exercise: Exercise, workoutExercise: WorkoutExercise) {
        self.id = id
        self.weight = weight
        self.reps = reps
        self.duration = duration
        self.type = type
        self.order = order
        self.exercise = exercise
        self.workoutExercise = workoutExercise
    }
}
