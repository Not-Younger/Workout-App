//
//  CardView.swift
//  Workout App
//
//  Created by Jonathan Young on 7/8/25.
//

import SwiftUI

struct CardView<Content: View>: View {
    @Environment(\.colorScheme) private var colorScheme
    let padding: CGFloat
    let content: () -> Content

    init(padding: CGFloat = 15, @ViewBuilder content: @escaping () -> Content) {
        self.padding = padding
        self.content = content
    }

    var body: some View {
        VStack(spacing: 15) {
            content()
        }
        .padding(padding)
        .fontDesign(.rounded)
        .background(colorScheme == .dark ? Color.black : Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.2), radius: 1)
        .shadow(color: .black.opacity(0.2), radius: 5)
    }
}

#Preview {
    CardView {
        Text("Hello World")
    }
}
