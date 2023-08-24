//
//  UIView+Extension.swift
//  TVScreeniOS
//
//  Created by Ehtisham Badar on 24/08/2023.
//

import Foundation
import UIKit

extension UIView {
    func addBottomArc(ofHeight height: CGFloat, topCornerRadius: CGFloat) {
        let arcBezierPath = UIBezierPath()
        arcBezierPath.move(to: CGPoint(x: 0, y: frame.height))
        arcBezierPath.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.width, y: frame.height), controlPoint: CGPoint(x: frame.width / 2, y: frame.height + height))
        arcBezierPath.close()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = arcBezierPath.cgPath
        let color = UIColor.redColor?.cgColor ?? UIColor.white.cgColor
        shapeLayer.fillColor = color
        layer.insertSublayer(shapeLayer, at: 1)
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = topCornerRadius
    }
}
