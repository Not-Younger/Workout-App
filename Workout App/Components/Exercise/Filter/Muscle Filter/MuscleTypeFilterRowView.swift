//
//  MuscleTypeFilterRowView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/27/25.
//

import SwiftUI

struct MuscleTypeFilterRowView: View {
    let muscleType: MuscleType?
    let isSelected: Bool
    
    init(muscleType: MuscleType?, isSelected: Bool = false) {
        self.muscleType = muscleType
        self.isSelected = isSelected
    }
    
    var body: some View {
        HStack {
            MuscleIconView(muscleType: muscleType)
            Text(muscleType?.rawValue ?? "All Muscles")
                .bold()
                .fontDesign(.rounded)
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.green)
            }
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    MuscleTypeFilterRowView(muscleType: .chest, isSelected: true)
}

