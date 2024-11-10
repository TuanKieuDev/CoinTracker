//
//  TitleLabel.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 15/05/2024.
//

import UIKit

class TitleLabel: UILabel {
    override init(frame: CGRect) {
            super.init(frame: frame)
            setup()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setup()
        }
        
        // MARK: - Setup
        
        private func setup() {
            // Customize label appearance here
            self.textColor = UIColor.black
            self.font = UIFont(name: "Avenir-Bold", size: 56)
        }
}
