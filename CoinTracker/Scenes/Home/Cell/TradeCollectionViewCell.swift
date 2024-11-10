//
//  TradeCollectionViewCell.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 16/05/2024.
//

import UIKit
import Reusable
import SDWebImage

final class TradeCollectionViewCell: UICollectionViewCell, NibReusable {
    
    @IBOutlet private weak var coinImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var suffixLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var changeView: UIButton!
    
    var onButtonTap: (() -> Void)?
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupTapGesture()
    }
    
    func configView(coin: Coin) {
        self.applyShadow()
        layer.cornerRadius = CGFloat(16)
        coinImageView.applyCircle()
        if let url = URL(string: coin.iconURL) {
            coinImageView.sd_setImage(with: url, placeholderImage: UIImage(systemName: "bitcoinsign.arrow.circlepath"))
        }
        nameLabel.text = coin.name
        suffixLabel.text = coin.symbol
        priceLabel.text = "$\(round(Double(coin.price)! * 1000) / 1000)"
        changeView.setTitle(coin.change, for: .normal)
        
        if coin.change.contains("-") {
            changeView.tintColor = .red
        } else {
            changeView.tintColor = .green
            changeView.setTitle("+" + coin.change, for: .normal)
        }
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
    }
}
