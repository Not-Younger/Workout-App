//
//  ExerciseType.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import Foundation

enum MuscleType: String, CaseIterable, Codable {
    case abdominals = "Abdominals"
    case abductors = "Abductors"
    case adductors = "Adductors"
    case biceps = "Biceps"
    case calves = "Calves"
    case cardio = "Cardio"
    case chest = "Chest"
    case erectorSpinae = "Erector Spinae"
    case forearms = "Forearms"
    case fullBody = "Full Body"
    case glutes = "Glutes"
    case gripStrength = "Grip Strength"
    case hamstrings = "Hamstrings"
    case hipFlexors = "Hip Flexors"
    case lats = "Lats"
    case lowerBack = "Lower Back"
    case neck = "Neck"
    case obliques = "Obliques"
    case quadriceps = "Quadriceps"
    case serratus = "Serratus Anterior"
    case shoulders = "Shoulders"
    case tibialisAnterior = "Shins (Tibialis Anterior)"
    case traps = "Traps"
    case triceps = "Triceps"
    case upperBack = "Upper Back"
    case other = "Other"
}

extension MuscleType {
    var region: MuscleRegion {
        switch self {
        case .biceps, .triceps, .shoulders, .chest, .forearms, .lats, .traps, .upperBack, .serratus, .gripStrength, .neck:
            return .upperBody
        case .quadriceps, .hamstrings, .glutes, .calves, .hipFlexors, .tibialisAnterior, .abductors, .adductors:
            return .lowerBody
        case .abdominals, .obliques, .lowerBack, .erectorSpinae:
            return .core
        case .fullBody:
            return .fullBody
        case .cardio:
            return .cardio
        default:
            return .other
        }
    }
}
