//
//  NewsTableViewCell.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 22/10/2024.
//

import UIKit
import Reusable

final class NewsTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet private weak var contentLabel: UILabel!
    @IBOutlet private weak var abbreviationLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var commentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configData(_ news: News) {
        contentLabel.text = news.title
        timeLabel.text = timeAgo(from: news.publishedAt)
        commentLabel.text = news.numComments
    }
}
