//
//  ExerciseDetailTabView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct ExerciseDetailTabView: View {
    @Binding var selectedTab: ExerciseDetailTab
    
    var body: some View {
        Picker("Tab", selection: $selectedTab) {
            ForEach(ExerciseDetailTab.allCases, id: \.self) { tab in
                Text(tab.rawValue)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal)
    }
}
