//
//  ColorGridView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/17/24.
//

import SwiftUI

struct ColorGridView: View {
    var viewModel: InputMeansViewModel
    private let columns = Array(repeating: GridItem(.fixed(50)), count: 10)
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(viewModel.seedViewModels) { seedViewModel in
                ColorSeedView(viewModel: seedViewModel) {
                    withAnimation(.easeOut(duration: 0.2)) {
                        viewModel.deleteColor(seedViewModel)
                    }
                }
            }
        }
    }
}

#Preview {
    ColorGridView(viewModel: .init())
}
