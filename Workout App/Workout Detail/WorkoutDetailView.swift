//
//  WorkoutDetailView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/8/25.
//

import SwiftUI

struct WorkoutDetailView: View {
    let workout: Workout
    
    var body: some View {
        Text(workout.name)
    }
}

//#Preview {
//    WorkoutDetailView()
//}
