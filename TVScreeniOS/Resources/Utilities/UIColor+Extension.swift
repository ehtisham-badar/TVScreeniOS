//
//  UIColor+Extension.swift
//  TVScreeniOS
//
//  Created by Ehtisham Badar on 24/08/2023.
//

import Foundation
import UIKit

extension UIColor {
    static var redColor: UIColor? {
            return hexStringToUIColor(hex: "DE0B2B")
        }
        
        static func hexStringToUIColor (hex: String) -> UIColor {
            var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
            
            if cString.hasPrefix("#") {
                cString.remove(at: cString.startIndex)
            }
            
            if (cString.count) != 6 {
                return UIColor.gray
            }
            
            var rgbValue: UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            
            return UIColor(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        }
}
