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
    var weightType: WeightUnitType
    var distanceType: DistanceUnitType
    var heightType: HeightUnitType

    @Relationship(deleteRule: .cascade) var sets: [ExerciseSet]
    @Relationship(deleteRule: .nullify) var workout: Workout
    @Relationship(deleteRule: .nullify) var exercise: Exercise
    
    init(id: UUID = UUID(), order: Int, notes: String? = nil, supersetNumber: Int? = nil, sets: [ExerciseSet] = [], workout: Workout, exercise: Exercise, weightType: WeightUnitType = .imperial, distanceType: DistanceUnitType = .imperial, heightType: HeightUnitType = .imperial) {
        self.id = id
        self.order = order
        self.notes = notes
        self.supersetNumber = supersetNumber
        self.sets = sets
        self.workout = workout
        self.exercise = exercise
        self.weightType = weightType
        self.distanceType = distanceType
        self.heightType = heightType
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
    
    var firstHeader: String {
        switch self.exercise.exerciseType {
        case .weightedReps:
            self.weightType == .metric ? "kg" : "lbs"
        case .bodyweightReps:
            self.weightType == .metric ? "+kg" : "+lbs"
        case .timeBased:
            self.weightType == .metric ? "+kg" : "+lbs"
        case .distanceTime:
            self.distanceType == .metric ? "km" : "mi"
        case .distanceOnly:
            self.distanceType == .metric ? "km" : "mi"
        case .timeOnly:
            "Time"
        case .repsOnly:
            "Reps"
        case .heightReps:
            self.heightType == .metric ? "cm" : "in"
        case .heightOnly:
            self.heightType == .metric ? "cm" : "in"
        }
    }
    
    var secondHeader: String? {
        switch self.exercise.exerciseType {
        case .weightedReps:
            "Reps"
        case .bodyweightReps:
            "Reps"
        case .timeBased:
            "Time"
        case .distanceTime:
            "Time"
        case .distanceOnly:
            nil
        case .timeOnly:
            nil
        case .repsOnly:
            nil
        case .heightReps:
            "Reps"
        case .heightOnly:
            nil
        }
    }
}
