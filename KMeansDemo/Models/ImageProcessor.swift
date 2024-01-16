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

    func processImage() {
        guard let inputImage else { return }
        Task {
            await processImageAsync(inputImage)
        }
    }

    private func processImageAsync(_ image: CIImage) async {
        isWorking = true

        let outputImage = image.applyingFilter("CIKMeans", parameters: [
            kCIInputExtentKey: CIVector(cgRect: image.extent),
            "inputCount": count
        ])
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
