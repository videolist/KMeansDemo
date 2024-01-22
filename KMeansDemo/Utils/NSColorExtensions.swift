//
//  NSColorExtensions.swift
//  KMeansDemo
//
//  Created by Vadim on 1/21/24.
//

import AppKit

extension NSColor {
    static var random: NSColor {
        NSColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1
        )
    }
}
