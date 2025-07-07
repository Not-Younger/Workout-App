//
//  PersonalRecordInfoView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct PersonalRecordInfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    let fontSize: CGFloat = 16
    let size: CGFloat = 25
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    VStack(spacing: 15) {
                        Text("Heaviest Weight").bold()
                        Text("The heaviest weight you've ever lifted.")
                    }
                    VStack(spacing: 15) {
                        Text("Best 1RM").bold()
                        Text("1RM (One Rep Max) uses reps and weight from a set to estimate the max weight you could lift for a single rep. This is the highest 1RM you've ever achieved.")
                    }
                    VStack(spacing: 15) {
                        Text("Best Set Volume").bold()
                        Text("The set in which you lifted the most volume (weight x reps).")
                    }
                    VStack(spacing: 15) {
                        Text("Best Session Volume").bold()
                        Text("Max Session Volume is the session you lifted the most weight in total over all your sets in this exercise.")
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
                .padding(.top, 30)
            }
            .scrollIndicators(.hidden)
            .scrollBounceBehavior(.basedOnSize)
            .navigationTitle("Personal Records")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Close") {
                        dismiss()
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

#Preview {
    PersonalRecordInfoView()
}
