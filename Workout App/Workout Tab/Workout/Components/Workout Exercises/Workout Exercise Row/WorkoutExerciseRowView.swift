//
//  WorkoutExerciseRowView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftData
import SwiftUI

struct WorkoutExerciseRowView: View {
    @Environment(\.modelContext) private var modelContext
    @Bindable var workout: Workout
    @Bindable var workoutExercise: WorkoutExercise
    @Binding var workoutExercises: [WorkoutExercise]
    @Binding var editMode: Bool
    
    @State private var notes: [WorkoutExerciseNote]
    
    init(workout: Workout, workoutExercise: WorkoutExercise, workoutExercises: Binding<[WorkoutExercise]>, editMode: Binding<Bool>) {
        self.workout = workout
        self.workoutExercise = workoutExercise
        _workoutExercises = workoutExercises
        _editMode = editMode
        self.notes = workoutExercise.notes.sorted(by: { $0.order < $1.order })
    }
    
    let rowHeight: CGFloat = 25
    let fontSize: CGFloat = 16
    
    @State private var isShowingExerciseDetails: Bool = false
    @State private var isShowingDeleteExerciseAlert: Bool = false
    
    var body: some View {
        HStack {
            ZStack {
                Group {
                    if editMode {
                        RoundedRectangle(cornerRadius: 8)
                    } else {
                        Rectangle()
                    }
                }
                .frame(width: 3)
                .foregroundStyle(workoutExercise.supersetColor)
                .padding(.top, 10)
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 3)
                    .foregroundStyle(workoutExercise.supersetColor)
                    .padding(.top, 5)
            }
            Button {
                isShowingExerciseDetails = true
            } label: {
                Text(workoutExercise.exercise.name)
                    .font(.system(size: fontSize))
                    .fontWeight(.bold)
            }
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $isShowingExerciseDetails) {
                ExerciseDetailView(exercise: workoutExercise.exercise)
            }
            Spacer()
            WorkoutExerciseMenuView(workoutExercise: workoutExercise, notes: $notes, isShowingDeleteExerciseAlert: $isShowingDeleteExerciseAlert, fontSize: fontSize, size: rowHeight)
                .alert("Remove Exercise?", isPresented: $isShowingDeleteExerciseAlert) {
                    Button("Remove", role: .destructive) {
                        withAnimation {
                            workout.workoutExercises.removeAll(where: { $0.id == workoutExercise.id })
                            workoutExercises.removeAll(where: { $0.id == workoutExercise.id })
                            modelContext.delete(workoutExercise)
                        }
                    }
                    Button("Cancel", role: .cancel) { }
                } message: {
                    Text("This removes '\(workoutExercise.exercise.name)' and all of its sets from your workout. You cannot undo this action.")
                }

            RoundedRectangle(cornerRadius: 8)
                .frame(width: 3)
                .foregroundStyle(Color.clear)
                .padding(.top, 5)
        }
        .moveDisabled(!editMode)
        .deleteDisabled(!editMode)
        .listRowSeparator(.hidden, edges: .all)
        
        if !editMode, !workoutExercise.notes.isEmpty {
            ForEach(notes) { note in
                WorkoutExerciseNoteView(note: note, supersetColor: workoutExercise.supersetColor)
            }
            .onDelete(perform: deleteNote)
        }
        
        if !editMode {
            WorkoutExerciseRowColumnsHeaderView(workoutExercise: workoutExercise, rowHeight: rowHeight, fontSize: fontSize)
                .deleteDisabled(true)
                .moveDisabled(true)
            
            WorkoutExerciseRowSetsView(workoutExercise: workoutExercise, rowHeight: rowHeight, fontSize: fontSize)
                .moveDisabled(true)
        }
    }
    
    func deleteNote(at offsets: IndexSet) {
        for offset in offsets {
            let note = notes[offset]
            // Delete it from local state, workout state, and the context
            notes.remove(at: offset)
            workoutExercise.notes.removeAll(where: { $0.id == note.id })
            modelContext.delete(note)
            // Update order
            resetIndices()
        }
    }
    
    func resetIndices() {
        for i in notes.indices {
            let note = notes[i]
            note.order = i
        }
    }
}
