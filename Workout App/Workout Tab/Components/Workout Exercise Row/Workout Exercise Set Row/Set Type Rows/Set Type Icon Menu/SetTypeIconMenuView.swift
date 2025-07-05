//
//  SetTypeIconMenuView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/2/25.
//

import SwiftUI

struct SetTypeIconMenuView: View {
    @Environment(\.colorScheme) private var colorScheme
    let exerciseSet: ExerciseSet
    
    @State private var isShowingMoreInfo: Bool = false
    
    var body: some View {
        Menu {
            Button {
                exerciseSet.type = exerciseSet.type == .warmup ? .normal : .warmup
            } label: {
                Text("Warm Up")
                if exerciseSet.type == .warmup {
                    Image(systemName: "checkmark")
                }
            }
            Button {
                exerciseSet.type = exerciseSet.type == .dropSet ? .normal : .dropSet
            } label: {
                Text("Drop Set")
                if exerciseSet.type == .dropSet {
                    Image(systemName: "checkmark")
                }
            }
            Button {
                exerciseSet.type = exerciseSet.type == .failure ? .normal : .failure
            } label: {
                Text("Failure")
                if exerciseSet.type == .failure {
                    Image(systemName: "checkmark")
                }
            }
            Button {
                isShowingMoreInfo = true
            } label: {
                Label("More Info", systemImage: "questionmark")
            }
        } label: {
            SetTypeIconView(order: exerciseSet.order, setType: exerciseSet.type)
        }
        .buttonStyle(PlainButtonStyle())
        .sheet(isPresented: $isShowingMoreInfo) {
            SetTypeInfoView()
        }
    }
    
    func getBackgroundColor() -> Color {
        switch  exerciseSet.type {
        case .warmup:
            return .orange
        case .normal:
            return colorScheme == .dark ? Color(.systemGray4) : Color(.systemGray5)
        case .dropSet:
            return .purple
        case .failure:
            return .red
        }
    }
}
