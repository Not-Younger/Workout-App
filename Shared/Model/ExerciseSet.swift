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
    var duration: TimeInterval?  // For time-based exercises
    var distance: Double?
    var height: Double?
    var reps: Int?
    var type: SetType
    var order: Int  // Order in the exercise

    @Relationship(deleteRule: .nullify) var exercise: Exercise
    @Relationship(deleteRule: .nullify) var workoutExercise: WorkoutExercise
    
    init(id: UUID = UUID(), weight: Double? = nil, duration: TimeInterval? = nil, distance: Double? = nil, height: Double? = nil, reps: Int? = nil, type: SetType, order: Int, workoutExercise: WorkoutExercise) {
        self.id = id
        self.weight = weight
        self.duration = duration
        self.distance = distance
        self.height = height
        self.reps = reps
        self.type = type
        self.order = order
        self.exercise = workoutExercise.exercise
        self.workoutExercise = workoutExercise
    }
}
