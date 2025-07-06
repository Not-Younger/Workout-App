//
//  WorkoutExerciseMenuView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftData
import SwiftUI

struct WorkoutExerciseMenuView: View {
    @Environment(\.modelContext) private var modelContext
    
    let workoutExercise: WorkoutExercise
    @Binding var notes: [WorkoutExerciseNote]
    @Binding var showStickyNote: Bool
    @Binding var isShowingDeleteExerciseAlert: Bool
    let fontSize: CGFloat
    let size: CGFloat
    
    var body: some View {
        Menu {
            Button {
                let order = workoutExercise.notes.count
                let newNote = WorkoutExerciseNote(text: "", order: order, workoutExercise: workoutExercise)
                withAnimation {
                    workoutExercise.notes.append(newNote)
                    notes.append(newNote)
                }
            } label: {
                Label("Add Note", systemImage: "document")
            }
            if !showStickyNote {
                Button {
                    withAnimation {
                        workoutExercise.exercise.note = ""
                        showStickyNote = true
                    }
                } label: {
                    Label("Add Sticky Note", systemImage: "pin")
                }
            }
            Button(role: .destructive) {
                isShowingDeleteExerciseAlert = true
            } label: {
                Label("Remove Exercise", systemImage: "xmark")
            }
        } label: {
            Image(systemName: "ellipsis")
                .foregroundStyle(.blue)
                .font(.system(size: fontSize, weight: .semibold))
                .frame(width: size, height: size)
                .background(Color.blue.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
