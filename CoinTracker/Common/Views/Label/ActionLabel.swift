//
//  ActionLabel.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 15/05/2024.
//

import UIKit

class ActionLabel: UILabel {
    var tapAction: (() -> Void)?
    
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
        self.font = UIFont(name: "Avenir", size: 20)
        self.textAlignment = .center
        self.textColor = UIColor.blue
    }
    
    func addTapGestureRecognizer() {
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(ActionLabel.tapView))
        self.addGestureRecognizer(tap)
    }
    
    @objc func tapView(sender:UITapGestureRecognizer) {
        tapAction?()
    }
}

