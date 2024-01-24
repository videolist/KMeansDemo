//
//  ColorSeedView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/18/24.
//

import SwiftUI

struct ColorSeedView: View {
    @State var viewModel: ColorSeedViewModel
    let didTapDelete: () -> Void
    let didChangeColor: () -> Void
    @State private var isHovering = false

    var body: some View {
        viewModel.color
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                ZStack {
                    ColorPicker("", selection: $viewModel.color)
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
            .onChange(of: viewModel.color) { _, _ in
                didChangeColor()
            }
    }
}

#Preview {
    ColorSeedView(viewModel: .init(color: .red)) {} didChangeColor: {}
        .frame(height: 50)
        .padding()
}
