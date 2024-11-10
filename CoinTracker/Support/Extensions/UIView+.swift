//
//  UIView+.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 17/10/2024.
//

import UIKit

extension UIView {
    func applyCircle() {
        layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = true
    }
    
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 1,
        blur: CGFloat = 2,
        spread: CGFloat = 0
    ) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur / 2.0
        layer.masksToBounds = false
        
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
