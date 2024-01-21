//
//  ColorSeedView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/18/24.
//

import SwiftUI

struct ColorSeedView: View {
    @Binding var color: NSColor
    let didTapDelete: () -> Void
    @State private var isHovering = false
    @State private var localColor: Color

    init(color: Binding<NSColor>, didTapDelete: @escaping () -> Void) {
        _color = color
        self.didTapDelete = didTapDelete
        localColor = Color(nsColor: color.wrappedValue)
    }

    var body: some View {
        localColor
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                ZStack {
                    ColorPicker("", selection: $localColor)
                    .labelsHidden()

                    if isHovering {
                        Button {
                            didTapDelete()
                        } label: {
                            Image(systemName: "minus.circle.fill")
                        }
                        .buttonStyle(.plain)
                        // This will push it to the top right corner
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: .infinity,
                            alignment: .topTrailing
                        )
                    }
                }
            }
            .onHover { over in
                isHovering = over
            }
    }
}

#Preview {
    ColorSeedView(color: .constant(.red)) {}
        .frame(height: 50)
        .padding()
}
