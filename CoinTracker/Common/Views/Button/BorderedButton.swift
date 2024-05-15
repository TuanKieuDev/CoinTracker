//
//  BorderedButton.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit

class BorderedButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Customize appearance
    
        self.layer.cornerRadius = 8
    }
    
}
