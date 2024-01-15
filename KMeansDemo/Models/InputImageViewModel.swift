//
//  InputImageViewModel.swift
//  KMeansDemo
//
//  Created by Vadim Dagman on 1/5/24.
//

import SwiftUI

@Observable 
class InputImageViewModel: DropDelegate {
    var image: NSImage?
    var ciImage: CIImage?

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
                    self.image = NSImage(data: data)
                    self.ciImage = CIImage(data: data, 
                                           options: [.applyOrientationProperty: true])
                }
            }
        }
        return true
    }
}
