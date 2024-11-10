//
//  TâpbleTitle.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 24/10/2024.
//

import UIKit

class TapableLabel: UILabel {

    // A closure that gets executed when the label is tapped
    var onTap: (() -> Void)?
    
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
        // Customize label appearance
        self.textColor = UIColor.black
        self.font = UIFont(name: "Avenir-Bold", size: 28)
        
        // Enable user interaction to detect tap gestures
        self.isUserInteractionEnabled = true
        
        // Add tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Actions
    
    @objc private func handleTap() {
        // Call the closure when the label is tapped
        onTap?()
    }
}
