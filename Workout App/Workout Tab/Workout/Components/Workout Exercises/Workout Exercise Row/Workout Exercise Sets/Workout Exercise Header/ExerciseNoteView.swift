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
    @Binding var isTextFocused: Bool
    
    @FocusState private var isFocused: Bool
    
    init(exercise: Exercise, supersetColor: Color? = nil, isTextFocused: Binding<Bool>) {
        self.exercise = exercise
        self.supersetColor = supersetColor
        _isTextFocused = isTextFocused
    }
    
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(supersetColor ?? Color.clear)
            TextField("Sticky Note", text: $exercise.note, axis: .vertical)
                .scrollDisabled(true)
                .focused($isFocused)
                .onChange(of: isFocused) { _, newValue in
                    if newValue {
                        isTextFocused = newValue
                    }
                }
            Rectangle()
                .frame(width: 3)
                .foregroundStyle(Color.clear)
        }
        .listRowBackground(Color.yellow.opacity(0.2))
    }
}
