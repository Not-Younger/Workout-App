//
//  WorkoutHeaderView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftUI

struct WorkoutHeaderView: View {
    @Bindable var workout: Workout
    
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer?
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Workout Name", text: $workout.name)
                .font(.title2.bold())
            Group {
                HStack {
                    Image(systemName: "calendar")
                    Text(workout.date.formatted(date: .abbreviated, time: .omitted))
                }
                HStack {
                    Image(systemName: "clock")
                    Text(formatElapsedTime(elapsedTime))
                        .monospacedDigit()
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

#Preview {
    WorkoutHeaderView(workout: Workout())
}
