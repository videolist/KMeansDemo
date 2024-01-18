//
//  ColorSeedView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/18/24.
//

import SwiftUI

struct ColorSeedView: View {
    let color: NSColor
    var body: some View {
        Rectangle()
            .fill(Color(nsColor: color))
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                Image(systemName: "minus.circle.fill")
                // This will push it to the top right corner
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            }
    }
}

#Preview {
    ZStack {
        ColorSeedView(color: .red)
            .frame(height: 50)
            .padding()
    }
}
