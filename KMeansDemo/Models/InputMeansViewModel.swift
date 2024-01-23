//
//  InputMeansViewModel.swift
//  KMeansDemo
//
//  Created by Vadim on 1/20/24.
//

import SwiftUI

@Observable 
class InputMeansViewModel {
    var seedViewModels = [ColorSeedViewModel]()

    func deleteColor(_ viewModel: ColorSeedViewModel) {
        seedViewModels = seedViewModels.filter { $0.id != viewModel.id }
    }

    func addColor(_ viewModel: ColorSeedViewModel) {
        seedViewModels.append(viewModel)
    }
}
