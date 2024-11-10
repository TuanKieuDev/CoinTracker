//
//  CategoryInformationTableViewCell.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 21/10/2024.
//

import UIKit
import Reusable

final class CategoryInformationTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupTapGesture()
    }

    func configData(category: Constants.Profile.Section) {
        categoryLabel.text = category.rawValue
        var image: UIImage?
        
        switch category {
        case .account:
            image = UIImage(systemName: "person.crop.circle")
        case .preferences:
            image = UIImage(systemName: "gearshape.fill")
        case .help:
            image = UIImage(systemName: "questionmark.circle.fill")
        case .community:
            image = UIImage(systemName: "person.line.dotted.person.fill")
        }
        
        iconImageView.tintColor = UIColor(named: "primary")
        iconImageView.image = image
    }

    private func setupTapGesture() {
        // Enable user interaction and add a tap gesture recognizer
        self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Handle Tap Animation
    
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
