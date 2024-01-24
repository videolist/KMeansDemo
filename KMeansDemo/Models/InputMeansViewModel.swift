//
//  InputMeansViewModel.swift
//  KMeansDemo
//
//  Created by Vadim on 1/20/24.
//

import SwiftUI

@Observable 
class InputMeansViewModel {
    let imageProcessor: ImageProcessor
    var seedViewModels: [ColorSeedViewModel]
    init(imageProcessor: ImageProcessor) {
        self.imageProcessor = imageProcessor
        seedViewModels = imageProcessor.inputMeans.map { .init(color: $0) }
    }

    func deleteColor(_ viewModel: ColorSeedViewModel) {
        seedViewModels = seedViewModels.filter { $0.id != viewModel.id }
    }

    func addColor(_ viewModel: ColorSeedViewModel) {
        seedViewModels.append(viewModel)
    }

    func apply() {
        let colors = seedViewModels.map(\.color).map { NSColor($0) }
        imageProcessor.inputMeans = colors
        imageProcessor.processImage()
    }
}
