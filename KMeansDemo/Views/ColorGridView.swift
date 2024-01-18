//
//  ColorGridView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/17/24.
//

import SwiftUI

struct ColorGridView: View {
    @State var colors: [NSColor]
    private let columns = Array(repeating: GridItem(.fixed(50)), count: 10)
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(colors, id: \.self) { color in
                ColorSeedView(color: color) {
                    withAnimation(.easeOut(duration: 0.2)) {
                        deleteColor(color)
                    }
                }
            }
        }
    }
}

private extension ColorGridView {
    func deleteColor(_ color: NSColor) {
        colors = colors.filter { !($0 === color) }
    }
}

#Preview {
    ColorGridView(colors: NSColor.randomColors(count: 15))
}

extension NSColor {
    static var random: NSColor {
        NSColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }

    static func randomColors(count: Int) -> [NSColor] {
        (0..<count).map { _ in NSColor.random }
    }
}
