//
//  ExerciseDetailPersonalRecordsView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct ExerciseDetailPersonalRecordsView: View {
    let exercise: Exercise
    
    @State private var isShowingPersonalRecordInfoSheet: Bool = false
    
    @State private var isShowingHeaviestWeightInfoAlert: Bool = false
    @State private var isShowingBest1RMInfoAlert: Bool = false
    @State private var isShowingBestSetVolumeInfoAlert: Bool = false
    @State private var isShowingBestSessionVolumeInfoAlert: Bool = false
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Image(systemName: "medal.fill")
                    .font(.system(size: 20))
                    .foregroundStyle(.yellow)
                    .frame(width: 20, height: 20)
                Text("Personal Records")
                    .foregroundStyle(.secondary)
                Spacer()
                QuestionButtonView($isShowingPersonalRecordInfoSheet)
                    .sheet(isPresented: $isShowingPersonalRecordInfoSheet) {
                        PersonalRecordInfoView()
                    }
            }
            HStack {
                Button {
                    isShowingHeaviestWeightInfoAlert = true
                } label: {
                    Text("Heaviest Weight")
                }
                .buttonStyle(PlainButtonStyle())
                .alert("Heaviest Weight", isPresented: $isShowingHeaviestWeightInfoAlert) {
                    Button("Ok") { }
                } message: {
                    Text("The heaviest weight you've ever lifted.")
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("225 lbs")
                }
            }
            HStack {
                Button {
                    isShowingBest1RMInfoAlert = true
                } label: {
                    Text("Best 1RM")
                }
                .buttonStyle(PlainButtonStyle())
                .alert("Best 1RM", isPresented: $isShowingBest1RMInfoAlert) {
                    Button("Ok") { }
                } message: {
                    Text("1RM (One Rep Max) uses reps and weight from a set to estimate the max weight you could lift for a single rep. This is the highest 1RM you've ever achieved.")
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("225 lbs")
                }
            }
            HStack {
                Button {
                    isShowingBestSetVolumeInfoAlert = true
                } label: {
                    Text("Best Set Volume")
                }
                .buttonStyle(PlainButtonStyle())
                .alert("Heaviest Weight", isPresented: $isShowingBestSetVolumeInfoAlert) {
                    Button("Ok") { }
                } message: {
                    Text("The set in which you lifted the most volume (weight x reps).")
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("225 lbs")
                }
            }
            HStack {
                Button {
                    isShowingBestSessionVolumeInfoAlert = true
                } label: {
                    Text("Best Session Volume")
                }
                .buttonStyle(PlainButtonStyle())
                .alert("Heaviest Weight", isPresented: $isShowingBestSessionVolumeInfoAlert) {
                    Button("Ok") { }
                } message: {
                    Text("Max Session Volume is the session you lifted the most weight in total over all your sets in this exercise.")
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("225 lbs")
                }
            }
        }
        .font(.system(size: 16))
        .padding(.horizontal)
    }
}
