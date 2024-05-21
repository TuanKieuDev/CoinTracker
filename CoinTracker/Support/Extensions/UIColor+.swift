//
//  UIColor+.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 15/05/2024.
//

import UIKit

extension UIColor {
    
    // swiftlint:disable:next large_tuple
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}
