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
    var count: Double = 8
    let countRange: ClosedRange<Double> = 0...128

    func processImage() {
        guard let inputImage else { return }
        let outputImage = inputImage.applyingFilter("CIKMeans", parameters: [
            kCIInputExtentKey: CIVector(cgRect: inputImage.extent),
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
    }
}
