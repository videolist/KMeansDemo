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
    var colors = NSColor.randomColors(count: 15)
    var applyChangeRequest: AnyPublisher<Void, Never> {
        applyChangeSubject.eraseToAnyPublisher()
    }
    private let applyChangeSubject = PassthroughSubject<Void, Never>()

    func deleteColor(_ color: NSColor) {
        colors = colors.filter { $0.id != color.id }
    }

    func applyChange() {
        applyChangeSubject.send(())
    }
}
