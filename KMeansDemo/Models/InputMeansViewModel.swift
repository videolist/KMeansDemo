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
    var seedViewModels = (0..<15).map { _ in ColorSeedViewModel() }

    func deleteColor(_ viewModel: ColorSeedViewModel) {
        seedViewModels = seedViewModels.filter { $0.id != viewModel.id }
    }
}
