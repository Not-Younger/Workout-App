//
//  QuestionButtonView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/6/25.
//

import SwiftUI

struct QuestionButtonView: View {
    @Binding var showAlert: Bool
    
    init(_ showAlert: Binding<Bool>) {
        _showAlert = showAlert
    }
    
    var body: some View {
        Button {
            showAlert = true
        } label: {
            Image(systemName: "questionmark.circle.fill")
                .font(.system(size: 20))
                .foregroundStyle(.secondary)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
