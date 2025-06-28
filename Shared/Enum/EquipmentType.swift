//
//  EquipmentType.swift
//  Workout App
//
//  Created by Jonathan Young on 6/26/25.
//

import Foundation

enum EquipmentType: String, CaseIterable, Codable {
    case none = "None"
    case bodyweight = "Bodyweight"
    case barbell = "Barbell"
    case dumbbells = "Dumbbells"
    case kettlebell = "Kettlebell"
    case plate = "Plate"
    case resistanceBand = "Resistance Band"
    case suspensionBand = "Suspension Band"
    case medicineBall = "Medicine Ball"
    case machine = "Machine"
    case other = "Other"
}

