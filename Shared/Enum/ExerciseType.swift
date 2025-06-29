//
//  ExerciseType.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import Foundation

enum ExerciseType: String, CaseIterable, Codable {
    case weightedReps       // e.g., bench press, squat
    case bodyweightReps     // e.g., pushups, pullup
    case timeBased          // e.g., plank, wallsit
    case distanceTime       // e.g., running, walking
    case distanceOnly       // e.g., steps
    case timeOnly           // e.g., jump rope
    case repsOnly           // e.g., wall balls
    case heightReps         // e.g., box jumps, depth drops
    case heightOnly         // e.g., max vertical
}
