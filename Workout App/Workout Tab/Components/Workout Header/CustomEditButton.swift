//
//  CustomEditButton.swift
//  Workout App
//
//  Created by Jonathan Young on 7/2/25.
//

import SwiftUI

struct CustomEditButton: View {
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        Button {
            withAnimation {
                if editMode?.wrappedValue == .active {
                    editMode?.wrappedValue = .inactive
                } else {
                    editMode?.wrappedValue = .active
                }
            }
        } label: {
            if editMode?.wrappedValue == .active {
                Text("Done")
            } else {
                Text("Edit")
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CustomEditButton()
}
