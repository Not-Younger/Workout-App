//
//  SummaryHeaderView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct SummaryHeaderView: View {
    @Bindable var exercise: Exercise
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(exercise.name)
                    .font(.system(size: 20, weight: .bold))
                Text("Primary: \(exercise.muscleType.rawValue)")
                    .foregroundStyle(.secondary)
                    .font(.system(size: 16))
                if !exercise.secondaryMuscleTypes.isEmpty {
                    Text("Secondary: \(exercise.getStringSecondaryMuscleTypes())")
                        .font(.system(size: 16))
                        .foregroundStyle(.secondary)
                }
            }
            Spacer()
        }
        .fontDesign(.rounded)
        .frame(maxWidth: .infinity)
    }
}
