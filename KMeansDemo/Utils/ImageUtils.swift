//
//  ImageUtils.swift
//  KMeansDemo
//
//  Created by Vadim Dagman on 1/5/24.
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

    func scaled(x: CGFloat, y: CGFloat) -> CIImage {
        transformed(by: CGAffineTransform(scaleX: x, y: y))
    }

    func scaledUniform(_ scale: CGFloat) -> CIImage {
        scaled(x: scale, y: scale)
    }

    func rotated(_ angle: CGFloat) -> CIImage {
        transformed(by: CGAffineTransform(rotationAngle: angle))
    }

    func rendered() -> CIImage? {
        guard let data = CIContext().pngRepresentation(
            of: self,
            format: .RGBA8,
            colorSpace: CGColorSpaceCreateDeviceRGB()
        ) else { return nil }
        return CIImage(data: data)
    }
}
