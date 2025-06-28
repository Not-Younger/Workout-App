//
//  Workout.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftData
import SwiftUI

@Model
class Workout {
    var id: UUID
    var name: String
    var note: String?
    var date: Date
    var duration: TimeInterval
    var finishDate: Date?

    init(id: UUID = .init(),
         name: String = "New Workout",
         note: String? = nil,
         date: Date = Date(),
         finishDate: Date? = nil,
         duration: TimeInterval = 0) {
        self.id = id
        self.name = name
        self.note = note
        self.date = date
        self.duration = duration
        self.finishDate = finishDate
    }
}
