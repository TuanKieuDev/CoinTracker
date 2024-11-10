//
//  CoinsRequest.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 30/10/2024.
//

import Foundation
import Alamofire

final class CoinsRequest: BaseRequest {
    required init() {
        let coinsHeaders: HTTPHeaders = [
            "x-rapidapi-key": APIs.key,
            "x-rapidapi-host": APIs.coinsHost
        ]

        let coinsParameters = ["timePeriod": TimePeriod.day.rawValue]

        super.init(url: APIs.coinsDomain,
                   requestType: .get,
                   parameter: coinsParameters,
                   headers: coinsHeaders)
    }
}
