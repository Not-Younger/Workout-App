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
    var finishDate: Date?

    init(id: UUID = .init(),
         name: String = "New Workout",
         note: String? = nil,
         date: Date = Date(),
         finishDate: Date? = nil) {
        self.id = id
        self.name = name
        self.note = note
        self.date = date
        self.finishDate = finishDate
    }
}
