//
//  PrimaryButton.swift
//  Cross Post
//
//  Created by Jonathan Young on 6/22/25.
//

import SwiftUI

struct FilterButtonLabel: View {
    let label: String
    
    init(_ label: String) {
        self.label = label
    }
    
    var body: some View {
        HStack {
            Text(label)
                .fontDesign(.rounded)
                .font(.headline)
                .lineLimit(1)
                .bold()
                .padding(.horizontal, 10)
                .padding(.vertical, 2)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    FilterButtonLabel("Create New Post")
}
