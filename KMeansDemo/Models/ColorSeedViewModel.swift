//
//  ColorSeedViewModel.swift
//  KMeansDemo
//
//  Created by Vadim on 1/21/24.
//

import SwiftUI

@Observable
class ColorSeedViewModel: Identifiable {
    let id = UUID().uuidString
    var color: Color = Color(nsColor: .random)
}
