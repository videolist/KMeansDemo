//
//  ProcessedImageView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/5/24.
//

import SwiftUI
import CoreImage

struct ProcessedImageView: View {
    let ciImage: CIImage?
    var body: some View {
        if let image = ciImage?.asNSImage() {
            Image(nsImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

#Preview {
    ProcessedImageView(ciImage: nil)
}
