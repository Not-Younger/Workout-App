//
//  MuscleTypeFilterView.swift
//  Workout App
//
//  Created by Jonathan Young on 6/27/25.
//

import SwiftUI

struct MuscleTypeFilterView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var muscleType: MuscleType?
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 50, height: 5)
                .padding(.vertical, 8)
            Text("Muscle")
                .bold()
                .padding(.bottom)
            List {
                Button {
                    muscleType = nil
                    dismiss()
                } label: {
                    MuscleTypeFilterRowView(muscleType: nil, isSelected: muscleType == nil)
                }
                .buttonStyle(PlainButtonStyle())
                ForEach(MuscleType.allCases, id: \.self) { type in
                    Button {
                        muscleType = type
                        dismiss()
                    } label: {
                        MuscleTypeFilterRowView(muscleType: type, isSelected: muscleType == type)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .listStyle(.inset)
        }
        .fontDesign(.rounded)
    }
}

#Preview {
    @Previewable @State var muscleType: MuscleType? = .chest
    MuscleTypeFilterView(muscleType: $muscleType)
}

