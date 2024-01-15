//
//  OriginalImageView.swift
//  KMeansDemo
//
//  Created by Vadim Dagman on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var imageProcessor = ImageProcessor()
    @State private var viewModel = InputImageViewModel()

    var body: some View {
        VStack {
            if let image = viewModel.image {
                HStack {
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    if let outputImage = imageProcessor.outputImage {
                        Image(nsImage: outputImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            } else {
                Text("Drag and drop an image here.")
                    .font(.headline)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray.opacity(0.3))
            }
        }  
        .onDrop(of: [.image], delegate: viewModel)
        .onChange(of: viewModel.ciImage) { _, newValue in
            if let newValue {
                imageProcessor.processImage(newValue)
            }
        }
    }
}

#Preview {
    ContentView()
}
