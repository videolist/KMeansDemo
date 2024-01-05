//
//  ImageProcessor.swift
//  KMeansDemo
//
//  Created by Vadim on 1/5/24.
//

import SwiftUI
import CoreImage

@Observable class ImageProcessor {
    private var ciImage: CIImage?

    var image: NSImage?

    func setInputImage(_ image: CIImage) {
        ciImage = image
        processImage()
    }

    func processImage() {
        guard let ciImage else {
            return
        }

        let outputImage = ciImage.applyingFilter("CIKMeans", parameters: [
            kCIInputExtentKey: CIVector(cgRect: ciImage.extent)
        ])
        image = outputImage.settingAlphaOne(in: outputImage.extent)
            // Disable interpolation so that it maintaines clear separation between colors
            .samplingNearest()
            // Blow up each pixel 50x
            .scaledUniform(50)
            // Make it vertical
            .rotated(.pi / 2)
            // Prerender so CPU it doesn't run the filter every time the window resizes to improve resizing performance
            .rendered()?
            .asNSImage()
    }
}
