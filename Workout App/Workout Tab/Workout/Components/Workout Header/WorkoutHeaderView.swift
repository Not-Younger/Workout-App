//
//  WorkoutHeaderView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutHeaderView: View {
    @Bindable var workout: Workout
    @Binding var workoutExercises: [WorkoutExercise]
    @Binding var editMode: Bool
    @Binding var isTextFocused: Bool
    @FocusState private var isNoteFocused: Bool
    
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer?
    @State private var note: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                TextField("Workout Name", text: $workout.name)
                    .font(.title2.bold())
                if !workoutExercises.isEmpty {
                    CustomEditButton(editMode: $editMode)
                }
            }
            .padding(.bottom, 10)
            Group {
                HStack {
                    Image(systemName: "calendar")
                        .frame(width: 15)
                    Text(workout.date.formatted(date: .abbreviated, time: .omitted))
                }
                HStack {
                    Image(systemName: "clock")
                        .frame(width: 15)
                    Text(formatElapsedTime(elapsedTime))
                        .monospacedDigit()
                }
                HStack(alignment: .top) {
                    Image(systemName: "text.document.fill")
                        .frame(width: 15)
                    TextField("Notes", text: $note, axis: .vertical)
                        .scrollDisabled(true)
                        .focused($isNoteFocused)
                        .onChange(of: note) { _, newValue in
                            workout.note = newValue.isEmpty ? nil : newValue
                        }
                        .onChange(of: isNoteFocused) { _, newValue in
                            if newValue {
                                isTextFocused = newValue
                            }
                        }
                }
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
        .listRowSeparator(.hidden)
        .onAppear {
            elapsedTime = Date().timeIntervalSince(workout.date)
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                elapsedTime = Date().timeIntervalSince(workout.date)
            }
        }
        .onDisappear {
            timer?.invalidate()
        }
    }
    
    func formatElapsedTime(_ interval: TimeInterval) -> String {
        let totalSeconds = Int(interval)
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
