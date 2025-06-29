//
//  ExerciseSortType.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import Foundation

enum ExerciseSortType: String, CaseIterable, Codable {
    case nameAscending
    case nameDescending
    case frequencyAscending
    case frequencyDescending
    case lastPerformedAscending
    case lastPerformedDescending
}
