//
//  InoutCountView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/16/24.
//

import SwiftUI

struct InputCountView: View {
    @Environment(ImageProcessor.self) private var imageProcessor
    private var range: ClosedRange<Double> {
        Double(imageProcessor.countRange.lowerBound)
        ...
        Double(imageProcessor.countRange.upperBound)
    }
    var body: some View {
        VStack {
            Text("\(Int(imageProcessor.count))")

            Slider(
                value: Binding(
                    get: { Double(imageProcessor.count) },
                    set: { imageProcessor.count = Int($0) }
                ),
                in: range,
                step: 1
            ) {
                Text("Input Count")
                    .font(.headline)
            } minimumValueLabel: {
                Text("\(Int(range.lowerBound))")
            } maximumValueLabel: {
                Text("\(Int(range.upperBound))")
            } onEditingChanged: { isEditing in
                if !isEditing {
                    // User released the slider
                    imageProcessor.processImage()
                }
            }
        }
        .padding()
    }
}

#Preview {
    InputCountView()
        .environment(ImageProcessor())
}
