//
//  HistoryTab.swift
//  Workout App
//
//  Created by Jonathan Young on 6/28/25.
//

import SwiftData
import SwiftUI

struct HistoryTab: View {
    @Query(filter: #Predicate<Workout> { workout in
        workout.finishDate != nil
    }, sort: \.date) var completedWorkouts: [Workout]
    
    var body: some View {
        List {
            ForEach(completedWorkouts) { workout in
                Text(workout.name)
            }
        }
        .navigationTitle("History")
    }
}

#Preview {
    HistoryTab()
}
