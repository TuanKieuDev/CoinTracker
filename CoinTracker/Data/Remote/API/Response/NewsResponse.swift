//
//  NewsResponse.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 05/11/2024.
//

import Foundation

// MARK: - Welcome
struct NewsWelcome: Codable {
    let data: [News]
}

// MARK: - Datum
struct News: Codable {
    let title: String
    let publishedAt: Int
    let author: String
    let url: String
    let numComments: String

    enum CodingKeys: String, CodingKey {
        case title
        case publishedAt = "published_at"
        case author, url
        case numComments = "num_comments"
    }
}
