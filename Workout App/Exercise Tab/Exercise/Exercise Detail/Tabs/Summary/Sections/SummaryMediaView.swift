//
//  SummaryMediaView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct SummaryMediaView: View {
    let exercise: Exercise
    
    var body: some View {
        Rectangle()
            .frame(height: 250)
            .foregroundStyle(Color.gray)
            .overlay {
                Image(systemName: "figure.strengthtraining.traditional")
                    .resizable()
                    .scaledToFit()
                    .padding(40)
            }
    }
}
