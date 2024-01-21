//
//  ColorSeedView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/18/24.
//

import Combine
import SwiftUI

struct ColorSeedView: View {
    @Binding var color: NSColor
    let didTapDelete: () -> Void
    @State private var isHovering = false
    private var cancellable: AnyCancellable?
    @State private var viewModel: ColorSeedViewModel

    init(
        color: Binding<NSColor>,
        applyChange: AnyPublisher<Void, Never>,
        didTapDelete: @escaping () -> Void
    ) {
        _color = color
        self.didTapDelete = didTapDelete
        viewModel = .init(color: Color(nsColor: color.wrappedValue))

        cancellable = applyChange
            .prefix(1)
            .sink { [self] in
                self.color = NSColor(viewModel.localColor)
            }
    }

    var body: some View {
        viewModel.localColor
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                ZStack {
                    ColorPicker("", selection: $viewModel.localColor)
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
    ColorSeedView(color: .constant(.red), applyChange: Just<Void>(()).eraseToAnyPublisher()) {}
        .frame(height: 50)
        .padding()
}
