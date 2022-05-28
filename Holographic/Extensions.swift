//
//  Extensions.swift
//  Holographic
//
//  Created by Pat Trudel on 5/28/22.
//

import UIKit

infix operator %: MultiplicationPrecedence
func % <T: FloatingPoint>(left: T, right: T) -> T {
    let v = left.truncatingRemainder(dividingBy: right)
    return v >= 0 ? v : v + right
}

extension UIImage {
    convenience init(from view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        self.init(cgImage:(UIGraphicsGetImageFromCurrentImageContext()?.cgImage!)!)
        UIGraphicsEndImageContext()
    }
}

extension CALayer {
    var radius: CGFloat {
        return sqrt(pow(bounds.width / 2, 2) + pow(bounds.height / 2, 2))
    }
    var size: CGSize {
        return frame.size
    }
}

public extension OperationQueue {
    static let background = OperationQueue()
}

extension UIView {
    func addParallaxRotation(maxRotationDegrees: CGFloat = 30.0, inverted: Bool = false) {
        var identity = CATransform3DIdentity
        identity.m34 = -1 / 500.0
        layer.transform = identity
        
        let effect = UIInterpolatingMotionEffect(keyPath: "layer.transform", type: .tiltAlongVerticalAxis)
        effect.minimumRelativeValue = CATransform3DRotate(identity, ((360.0 - maxRotationDegrees) * .pi) / (180.0 * (inverted ? -1.0 : 1.0)), 1.0, 0.0, 0.0)
        effect.maximumRelativeValue = CATransform3DRotate(identity, (maxRotationDegrees * .pi) / (180.0 * (inverted ? -1.0 : 1.0)), 1.0, 0.0, 0.0)
        
        addMotionEffect(effect)
    }
}
