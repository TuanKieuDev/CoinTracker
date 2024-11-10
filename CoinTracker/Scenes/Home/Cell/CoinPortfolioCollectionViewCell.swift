//
//  CoinPortfolioCollectionViewCell.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 18/10/2024.
//

import UIKit
import Reusable

final class CoinPortfolioCollectionViewCell: UICollectionViewCell, NibReusable {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configView()
        setupTapGesture()
    }
    
    private func configView() {
        self.layer.cornerRadius = 16
        self.clipsToBounds = true
        self.backgroundColor = .red
        self.applyShadow()
    }
    
    private func setupTapGesture() {
        // Enable user interaction and add a tap gesture recognizer
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func handleTap() {
        // Save the original background color to revert back to it
        let originalColor = self.contentView.backgroundColor
        
        // Perform flash animation
        UIView.animate(withDuration: 0.1, animations: {
            self.contentView.backgroundColor = UIColor.lightGray  // Temporary color for flash effect
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                self.contentView.backgroundColor = originalColor  // Revert to original color
            }
        }
        print("Tapped")
    }
}
