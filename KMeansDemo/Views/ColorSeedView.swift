//
//  ColorSeedView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/18/24.
//

import SwiftUI

struct ColorSeedView: View {
    @State var isHovering = false
    @Binding var color: NSColor
    let didTapDelete: () -> Void
    @State private var isFocused = false

    var body: some View {
        Color(nsColor: color)
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                ZStack {
                    ColorPicker("", selection: Binding(
                        get: { Color(nsColor: color) },
                        set: { color = NSColor($0) }
                    ))
                    .labelsHidden()
                    
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
            }
            .onHover { over in
                isHovering = over
            }
            .onChange(of: color) { _, _ in
                isFocused = true
            }
    }
}

#Preview {
    ColorSeedView(color: .constant(.red)) {}
        .frame(height: 50)
        .padding()
}
