//
//  GeneralInformationTableViewCell.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 21/10/2024.
//

import UIKit
import Reusable

final class GeneralInformationTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var generalStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configView()
    }
    
    func configView() {
        generalStackView.do {
            $0.layer.cornerRadius = 16
            $0.clipsToBounds = true
            $0.layer.borderWidth = 1
            $0.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        }
    }
}
