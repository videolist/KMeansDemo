//
//  ProcessedImageView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/5/24.
//

import SwiftUI
import CoreImage

struct ProcessedImageView: View {
    @Environment(ImageProcessor.self) private var imageProcessor
    var body: some View {
        if let image = imageProcessor.image {
            Image(nsImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

#Preview {
    ProcessedImageView()
        .environment(ImageProcessor())
}
