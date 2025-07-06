//
//  ExerciseNoteView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct ExerciseNoteView: View {
    @Bindable var exercise: Exercise
    let supersetColor: Color?
    
    init(exercise: Exercise, supersetColor: Color? = nil) {
        self.exercise = exercise
        self.supersetColor = supersetColor
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(supersetColor ?? Color.clear)
            TextField("Sticky Note", text: $exercise.note, axis: .vertical)
                .scrollDisabled(true)
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(Color.clear)
        }
        .listRowBackground(Color.yellow.opacity(0.2))
    }
}
