//
//  NewsRequest.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 29/10/2024.
//

import Foundation
import Alamofire

final class NewsRequest: BaseRequest {
    required init() {
        let newsHeaders: HTTPHeaders = [
            "x-rapidapi-key": APIs.key,
            "x-rapidapi-host": APIs.newsHost
        ]

        let newsParameters = ["news_type": NewsType.latest.rawValue, "page": 1] as [String : Any]

        super.init(url: APIs.newsDomain,
                   requestType: .get,
                   parameter: newsParameters,
                   headers: newsHeaders)
    }
}
