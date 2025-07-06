//
//  CustomEditButton.swift
//  Workout App
//
//  Created by Jonathan Young on 7/2/25.
//

import SwiftUI

struct CustomEditButton: View {
    @Binding var editMode: Bool
    
    var body: some View {
        Button {
            withAnimation {
                if editMode {
                    editMode = false
                } else {
                    editMode = true
                }
            }
        } label: {
            if editMode {
                Text("Done")
            } else {
                Text("Edit")
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
