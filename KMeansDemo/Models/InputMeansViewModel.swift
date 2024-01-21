//
//  InputMeansViewModel.swift
//  KMeansDemo
//
//  Created by Vadim on 1/20/24.
//

import SwiftUI

@Observable 
class InputMeansViewModel {
    var colors = NSColor.randomColors(count: 15)

    func deleteColor(_ color: NSColor) {
        colors = colors.filter { $0.id != color.id }
    }
}
