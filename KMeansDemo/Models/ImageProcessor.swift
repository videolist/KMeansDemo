//
//  ImageProcessor.swift
//  KMeansDemo
//
//  Created by Vadim Dagman on 1/5/24.
//

import SwiftUI
import CoreImage

@Observable 
class ImageProcessor {
    var outputImage: NSImage?
    var inputImage: CIImage? {
        didSet {
            processImage()
        }
    }
    var count = 8
    let countRange = 0...128
    var isWorking = false
    var inputMeans: [NSColor] = []

    private func parameters(inputImage: CIImage) -> [String: Any] {
        var parameters: [String: Any] = [
            kCIInputExtentKey: CIVector(cgRect: inputImage.extent),
            "inputCount": count
        ]
        if !inputMeans.isEmpty {
            parameters["inputMeans"] = CIImage.fromColors(inputMeans)
        }
        return parameters
    }

    func processImage() {
        guard let inputImage else { return }
        isWorking = true
        Task {
            await processImageAsync(inputImage)
        }
    }

    private func processImageAsync(_ image: CIImage) async {
        let outputImage = image.applyingFilter("CIKMeans", parameters: parameters(inputImage: image))
        self.outputImage = outputImage
            .settingAlphaOne(in: outputImage.extent)
            .foldOnePixelHighImage()
        // Disable interpolation so that it maintains clear separation between colors
            .samplingNearest()
        // Blow up each pixel 50x
            .scaledUniform(50)
        // Make it vertical
            .rotated(-.pi / 2)
        // Prerender so CPU it doesn't run the filter every time the window resizes to improve resizing performance
            .rendered()?
            .asNSImage()
        
        isWorking = false
    }
}
