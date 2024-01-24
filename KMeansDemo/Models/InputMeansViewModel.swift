//
//  InputMeansViewModel.swift
//  KMeansDemo
//
//  Created by Vadim on 1/20/24.
//

import Combine
import SwiftUI

@Observable 
class InputMeansViewModel {
    let imageProcessor: ImageProcessor
    var seedViewModels: [ColorSeedViewModel]
    init(imageProcessor: ImageProcessor) {
        self.imageProcessor = imageProcessor
        seedViewModels = imageProcessor.inputMeans.map { .init(color: $0) }
    }

    var hasChanged = false

    func deleteColor(_ viewModel: ColorSeedViewModel) {
        seedViewModels = seedViewModels.filter { $0.id != viewModel.id }
        hasChanged = true
    }

    func addColor(_ viewModel: ColorSeedViewModel) {
        seedViewModels.append(viewModel)
        hasChanged = true
    }

    func apply() {
        let colors = seedViewModels.map(\.color).map { NSColor($0) }
        imageProcessor.inputMeans = colors
        imageProcessor.processImage()
        hasChanged = false
    }
}
