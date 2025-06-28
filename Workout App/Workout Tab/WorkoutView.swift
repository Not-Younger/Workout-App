//
//  WorkoutView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftData
import SwiftUI

struct WorkoutView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(ContentView.ViewModel.self) private var VM: ContentView.ViewModel
    
    @Bindable var workout: Workout
    
    var body: some View {
        List {
            TextField("Workout Name", text: $workout.name)
        }
        .toolbar {
            ToolbarItemGroup(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.down")
                }
            }
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "timer")
                }
                Button("Finish") {
                    workout.finishDate = Date()
                    VM.currentWorkout = nil
                    print("Finished workout: \(workout.name) at \(workout.finishDate!)")
                    dismiss()
                }
            }
        }
    }
}

//#Preview {
//    NavigationStack {
//        WorkoutView(workout: Workout())
//    }
//}
