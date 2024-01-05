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
        guard let ciImage else { return }
        image = ciImage.asNSImage()
    }
}
