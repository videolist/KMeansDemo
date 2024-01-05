//
//  ImageUtils.swift
//  KMeansDemo
//
//  Created by Vadim on 1/5/24.
//

import CoreImage
import Cocoa

extension CIImage {
    func asNSImage() -> NSImage? {
        let rep = NSCIImageRep(ciImage: self)
        let updateImage = NSImage(size: rep.size)
        updateImage.addRepresentation(rep)
        return updateImage
    }
}
