//
//  HideKeyboardButtonView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/11/25.
//

import SwiftUI

struct HideKeyboardButtonView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    @Binding var isTextFocused: Bool
    
    var body: some View {
        Button {
            hideKeyboard()
            isTextFocused = false
        } label: {
            Image(systemName: "keyboard.chevron.compact.down")
                .font(.system(size: 20))
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
                .foregroundStyle(colorScheme == .dark ? .black: .white)
                .background(colorScheme == .dark ? .white : .black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .buttonStyle(PlainButtonStyle())
    }
}
