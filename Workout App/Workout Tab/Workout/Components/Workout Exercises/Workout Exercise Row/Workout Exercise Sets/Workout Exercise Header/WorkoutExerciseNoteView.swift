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
    @Binding var isTextFocused: Bool
    
    @FocusState private var isFocused: Bool
    
    init(note: WorkoutExerciseNote, supersetColor: Color? = nil, isTextFocused: Binding<Bool>) {
        self.note = note
        self.text = note.text
        self.supersetColor = supersetColor
        _isTextFocused = isTextFocused
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(supersetColor ?? Color.clear)
            TextField("Notes", text: $text, axis: .vertical)
                .scrollDisabled(true)
                .focused($isFocused)
                .onChange(of: text) { _, newValue in
                    note.text = newValue
                }
                .onChange(of: isFocused) { _, newValue in
                    if newValue {
                        isTextFocused = newValue
                    }
                }
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(Color.clear)
        }
    }
}

