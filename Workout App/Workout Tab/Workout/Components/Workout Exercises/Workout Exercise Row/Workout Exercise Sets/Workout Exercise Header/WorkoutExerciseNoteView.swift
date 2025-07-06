//
//  WorkoutExerciseNoteView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct WorkoutExerciseNoteView: View {
    let note: WorkoutExerciseNote
    @State private var text: String
    let supersetColor: Color?
    
    init(note: WorkoutExerciseNote, supersetColor: Color? = nil) {
        self.note = note
        self.text = note.text
        self.supersetColor = supersetColor
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(supersetColor ?? Color.clear)
            TextField("Notes", text: $text, axis: .vertical)
                .scrollDisabled(true)
                .onChange(of: text) { _, newValue in
                    note.text = newValue
                }
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(Color.clear)
        }
    }
}

