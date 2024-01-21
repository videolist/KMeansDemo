//
//  ColorSeedViewModel.swift
//  KMeansDemo
//
//  Created by Vadim on 1/21/24.
//

import Combine
import Foundation
import SwiftUI

@Observable
class ColorSeedViewModel {
    var localColor: Color
    private var cancellable: AnyCancellable?

    init(color: Binding<NSColor>, applyChange: AnyPublisher<Void, Never>) {
        localColor = Color(nsColor: color.wrappedValue)

        cancellable = applyChange
            .prefix(1)
            .sink { [unowned self] in
                color.wrappedValue = NSColor(localColor)
            }
    }
}
