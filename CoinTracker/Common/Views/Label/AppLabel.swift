//
//  AppLabel.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 15/05/2024.
//

import UIKit

class AppLabel: UILabel {
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
        self.font = UIFont(name: "Avenir", size: 14)
        self.textAlignment = .center
        self.textColor = UIColor.black
    }
}
