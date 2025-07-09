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
    var isCompleted: Bool
    var order: Int  // Order in the exercise
    
    // Previous
    var previousWeight: Double?
    var previousDuration: TimeInterval?
    var previousDistance: Double?
    var previousHeight: Double?
    var previousReps: Int?

    @Relationship(deleteRule: .nullify) var exercise: Exercise
    @Relationship(deleteRule: .nullify) var workoutExercise: WorkoutExercise?
    
    init(id: UUID = UUID(),
         weight: Double? = nil,
         duration: TimeInterval? = nil,
         distance: Double? = nil,
         height: Double? = nil,
         reps: Int? = nil,
         type: SetType,
         isCompleted: Bool = false,
         order: Int,
         previousWeight: Double? = nil,
         previousDuration: TimeInterval? = nil,
         previousDistance: Double? = nil,
         previousHeight: Double? = nil,
         previousReps: Int? = nil,
         exercise: Exercise,
         workoutExercise: WorkoutExercise? = nil) {
        self.id = id
        self.weight = weight
        self.duration = duration
        self.distance = distance
        self.height = height
        self.reps = reps
        self.type = type
        self.isCompleted = isCompleted
        self.order = order
        self.previousWeight = previousWeight
        self.previousDuration = previousDuration
        self.previousDistance = previousDistance
        self.previousHeight = previousHeight
        self.previousReps = previousReps
        self.exercise = exercise
        self.workoutExercise = workoutExercise
    }
}

extension ExerciseSet {
    func currentString(weightType: WeightUnitType? = nil, distanceType: DistanceUnitType? = nil, heightType: HeightUnitType? = nil) -> String? {
        switch self.exercise.exerciseType {
        case .weightedReps:
            if let weight, let reps, let weightType {
                return "\(GlobalHelpers.formatDouble(weight)) \(weightType == .imperial ? "lb" : "kg") x \(reps)"
            }
        case .bodyweightReps:
            if let weight, let reps, let weightType {
                return "+\(weight) \(weightType == .imperial ? "lb" : "kg") x \(reps)"
            }
        case .timeBased:
            if let weight, let duration, let weightType {
                return "+\(weight) \(weightType == .imperial ? "lb" : "kg") x \(duration)"
            }
        case .distanceTime:
            if let distance, let duration, let distanceType {
                return "\(distance) \(distanceType == .imperial ? "mi" : "km") in \(duration)"
            }
        case .distanceOnly:
            if let distance, let distanceType {
                return "\(distance) \(distanceType == .imperial ? "mi" : "km")"
            }
        case .timeOnly:
            if let duration {
                return "\(duration)"
            }
        case .repsOnly:
            if let reps {
                return "\(reps)"
            }
        case .heightReps:
            if let height, let reps, let heightType {
                return "\(height) \(heightType == .imperial ? "in" : "cm") x \(reps)"
            }
        case .heightOnly:
            if let height, let heightType {
                return "\(height) \(heightType == .imperial ? "in" : "cm")"
            }
        }
        return nil
    }
    
    func get1RepMaxString(weightType: WeightUnitType) -> Int? {
        if let weight, let reps {
            return Int(weight * (1 + Double(reps) / 30.0))
        }
        return nil
    }
    
    func previousString(weightType: WeightUnitType? = nil, distanceType: DistanceUnitType? = nil, heightType: HeightUnitType? = nil) -> String? {
        switch self.exercise.exerciseType {
        case .weightedReps:
            if let previousWeight, let previousReps, let weightType {
                return "\(GlobalHelpers.formatDouble(previousWeight)) \(weightType == .imperial ? "lb" : "kg") x \(previousReps)"
            }
        case .bodyweightReps:
            if let previousWeight, let previousReps, let weightType {
                return "+\(previousWeight) \(weightType == .imperial ? "lb" : "kg") x \(previousReps)"
            }
        case .timeBased:
            if let previousWeight, let previousDuration, let weightType {
                return "+\(previousWeight) \(weightType == .imperial ? "lb" : "kg") x \(previousDuration)"
            }
        case .distanceTime:
            if let previousDistance, let previousDuration, let distanceType {
                return "\(previousDistance) \(distanceType == .imperial ? "mi" : "km") in \(previousDuration)"
            }
        case .distanceOnly:
            if let previousDistance, let distanceType {
                return "\(previousDistance) \(distanceType == .imperial ? "mi" : "km")"
            }
        case .timeOnly:
            if let previousDuration {
                return "\(previousDuration)"
            }
        case .repsOnly:
            if let previousReps {
                return "\(previousReps)"
            }
        case .heightReps:
            if let previousHeight, let previousReps, let heightType {
                return "\(previousHeight) \(heightType == .imperial ? "in" : "cm") x \(previousReps)"
            }
        case .heightOnly:
            if let previousHeight, let heightType {
                return "\(previousHeight) \(heightType == .imperial ? "in" : "cm")"
            }
        }
        return nil
    }
    
    func getSuggestedWeight() -> Double? {
        let previousSets: [ExerciseSet] = self.workoutExercise?.sets ?? []
        // Priority 1: Get most previous set with a weight typed in
        if self.order < previousSets.count {
            for previousSet in previousSets.sorted(by: { $0.order < $1.order })[..<self.order].reversed() {
                if let previousWeight = previousSet.weight {
                    // If using previous values, skip
                    if let previousSetPreviousWeight = previousSet.previousWeight, previousWeight == previousSetPreviousWeight {
                        continue
                    }
                    return previousWeight
                }
            }
            // Priority 2: Use own previous weight
            if let previousWeight = self.previousWeight {
                return previousWeight
            }
            // Priority 3: Use the previous set's previous weight
            for previousSet in previousSets.sorted(by: { $0.order < $1.order })[..<self.order].reversed() {
                if let previousWeight = previousSet.previousWeight {
                    return previousWeight
                }
            }
        }
        return nil
    }
    
    func getSuggestedReps() -> Int? {
        let previousSets: [ExerciseSet] = self.workoutExercise?.sets ?? []
        // Priority 1: Get most previous set with a reps typed in
        if self.order < previousSets.count {
            for previousSet in previousSets.sorted(by: { $0.order < $1.order })[..<self.order].reversed() {
                if let previousReps = previousSet.reps {
                    // If using previous values, skip
                    if let previousSetPreviousReps = previousSet.previousReps, previousReps == previousSetPreviousReps {
                        continue
                    }
                    return previousReps
                }
            }
            // Priority 2: Use own previous reps
            if let previousReps = self.previousReps {
                return previousReps
            }
            // Priority 3: Use the previous set's previous reps
            for previousSet in previousSets.sorted(by: { $0.order < $1.order })[..<self.order].reversed() {
                if let previousReps = previousSet.previousReps {
                    return previousReps
                }
            }
        }
        return nil
    }
}
