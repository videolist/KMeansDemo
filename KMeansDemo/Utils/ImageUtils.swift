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

    func shifted(by point: CGPoint) -> CIImage {
        return transformed(by: CGAffineTransform(translationX: point.x, y: point.y))
    }

    func moved(to origin: CGPoint = .zero) -> CIImage {
        return shifted(by: .init(x: origin.x - extent.minX, y: origin.y - extent.minY))
    }

    /// Wraps around a 1 pixel high image by breaking it down into stripes of the given size
    /// and stacking them one under the other
    func foldOnePixelHighImage(strideLength: Int = 8) -> CIImage {
        guard extent.height == 1 else {
            return self
        }
        let imageLength = Int(extent.width)
        let xPositions = stride(from: 0, through: imageLength, by: strideLength)

        var image = CIImage()
        for (index, position) in xPositions.enumerated() {
            let length = min(imageLength - position, strideLength)
            guard length > 0 else { break }
            image = cropped(to: .init(x: position, y: 0, width: length, height: 1))
                .moved(to: .init(x: 0, y: index))
                .composited(over: image)
        }

        return image
    }

    /// Creates 1 pixel high image out of an array of colors
    static func fromColors(_ colors: [NSColor]) -> CIImage {
        let pixels = colors
            .compactMap { CIColor(color: $0) }
            .map { CIImage(color: $0) }
            .map { $0.cropped(to: CGRect(x: 0, y: 0, width: 1, height: 1)) }

        var image = CIImage()
        for (index, pixel) in pixels.enumerated() {
            image = pixel.moved(to: .init(x: index, y: 0))
                .composited(over: image)
        }

        return image
    }
}
