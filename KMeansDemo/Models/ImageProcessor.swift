//
//  ImageProcessor.swift
//  KMeansDemo
//
//  Created by Vadim Dagman on 1/5/24.
//

import SwiftUI
import CoreImage

@Observable class ImageProcessor {
    var image: NSImage?

    func processImage( _ ciImage: CIImage) {
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
