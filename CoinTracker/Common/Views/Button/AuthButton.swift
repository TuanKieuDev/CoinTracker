//
//  AuthButton.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit

class AuthButton: BorderedButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Customize appearance
        self.backgroundColor = .blue
        self.setTitleColor(.white, for: .normal)
//        self.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
}
