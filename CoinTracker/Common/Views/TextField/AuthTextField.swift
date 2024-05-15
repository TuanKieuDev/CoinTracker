//
//  AuthTextField.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit

class AuthTextField: UITextField {
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            self.textColor = .black
            self.font = UIFont.systemFont(ofSize: 16)
            self.borderStyle = .roundedRect
//            self.layer.borderColor = UIColor.gray.cgColor
//            self.layer.borderWidth = 1.0
        }
}
