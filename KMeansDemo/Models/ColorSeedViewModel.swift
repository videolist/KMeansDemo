//
//  ColorSeedViewModel.swift
//  KMeansDemo
//
//  Created by Vadim on 1/21/24.
//

import Foundation
import SwiftUI

@Observable
class ColorSeedViewModel {
    var localColor: Color

    init(color: Color) {
        self.localColor = color
    }
}
