//
//  OriginalImageView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/5/24.
//

import SwiftUI

struct PreviewView: View {
    @StateObject var viewModel = InputImageViewModel()

    var body: some View {
        VStack {
            if let image = viewModel.image {
                HStack {
                    Image(nsImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                    if let ciImage = viewModel.ciImage {
                        ProcessedImageView(ciImage: ciImage)
                    }
                }
            } else {
                Text("Drag and drop an image here.")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray.opacity(0.3))
            }
        }  
        .onDrop(of: [.image], delegate: viewModel)
    }
}

#Preview {
    PreviewView()
}
