//
//  InputImageViewModel.swift
//  KMeansDemo
//
//  Created by Vadim on 1/5/24.
//

import SwiftUI

class InputImageViewModel: ObservableObject, DropDelegate {
    private var data: Data? {
        didSet {
            guard let data else { return }
            ciImage = CIImage(data: data)
        }
    }

    var image: NSImage? {
        ciImage?.asNSImage()
    }
    @Published var ciImage: CIImage?

    func performDrop(info: DropInfo) -> Bool {
        // Check if there are items conforming to the specified types
        guard let provider = info.itemProviders(for: [.image]).first else { return false }
        _ = provider.loadDataRepresentation(for: .image) { data, error in
            if let error = error {
                print("Error loading dropped item: \(error.localizedDescription)")
                return
            }

            if let data {
                DispatchQueue.main.async {
                    self.data = data
                }
            }
        }
        return true
    }
}