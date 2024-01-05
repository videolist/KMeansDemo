//
//  OriginalImageView.swift
//  KMeansDemo
//
//  Created by Vadim on 1/5/24.
//

import SwiftUI

struct OriginalImageView: View, DropDelegate {
    @State private var image: NSImage?

    func performDrop(info: DropInfo) -> Bool {
        // Check if there are items conforming to the specified types
        guard let provider = info.itemProviders(for: [.image]).first else { return false }
        _ = provider.loadDataRepresentation(for: .image) { data, error in
            if let error = error {
                print("Error loading dropped item: \(error.localizedDescription)")
                return
            }

            if let data, let droppedImage = NSImage(data: data) {
                DispatchQueue.main.async {
                    self.image = droppedImage
                }
            }
        }
        return true

    }

    var body: some View {
        VStack {
            if let image = image {
                Image(nsImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                Text("Drag and drop an image here.")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray.opacity(0.3))
            }
        }  
        .onDrop(of: [.image], delegate: self)
    }
}

#Preview {
    OriginalImageView()
}
