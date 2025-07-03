//
//  SetTypeInfoView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/2/25.
//

import SwiftUI

struct SetTypeInfoView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                Text("Set Types")
                    .font(.title).bold()
                    .padding(.bottom)
                VStack(spacing: 15) {
                    HStack {
                        SetTypeIconView(setType: .warmup)
                        Text("About Warm Up Sets").bold()
                    }
                    Text("Warm Up sets are intended to prepare the body for heavier weight loads. They are not counted in metrics or charts.")
                    Text("Mark a set as a Warm Up to keep it separate from the Work Sets (sets intended to stimulate muscle growth).")
                }
                VStack(spacing: 15) {
                    HStack {
                        SetTypeIconView(setType: .dropSet)
                        Text("About Drop Sets").bold()
                    }
                    Text("Drop Sets are sets in which the weight is lowered ('Dropped') in order to perform additional reps a lower weight (with no rest), typically after muscular failure has been reached.")
                    Text("Mark a set as a Drop Set in order to show it is part of a larger group.")
                }
                VStack(spacing: 15) {
                    HStack {
                        SetTypeIconView(setType: .failure)
                        Text("About Failure Sets").bold()
                    }
                    Text("If a set is marked as Failure, all reps will still count in charts and records. Mark a set as Failure if an additional rep was attempted, but not completed successfully.")
                }
                Button {
                    dismiss()
                } label: {
                    Text("Got it!")
                        .fontDesign(.rounded)
                        .bold()
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(BorderedProminentButtonStyle())
                .tint(.primary)
            }
            .fontDesign(.rounded)
            .multilineTextAlignment(.center)
            .padding()
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    SetTypeInfoView()
}
