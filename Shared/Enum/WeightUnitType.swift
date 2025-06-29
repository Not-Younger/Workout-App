//
//  WeightUnitType.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import Foundation

enum WeightUnitType: String, CaseIterable, Codable {
    case metric = "Metric (kg)"
    case imperial = "US/Imperial (lbs)"
}
