//
//  ColorSeedView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/18/24.
//

import SwiftUI

struct ColorSeedView: View {
    @State var isHovering = false
    let color: NSColor
    let didTapDelete: () -> Void

    var body: some View {
        Rectangle()
            .fill(Color(nsColor: color))
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                if isHovering {
                    Button {
                        didTapDelete()
                    } label: {
                        Image(systemName: "minus.circle.fill")
                    }
                    .buttonStyle(.plain)
                    // This will push it to the top right corner
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                }
            }
            .onHover { over in
                isHovering = over
            }
    }
}

#Preview {
    ZStack {
        ColorSeedView(color: .red) {}
            .frame(height: 50)
            .padding()
    }
}
