//
//  CoinsRepository.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 30/10/2024.
//

import Foundation
import Alamofire
import RxSwift

protocol CoinsRepository {
    func getCoins(input: CoinsRequest) -> Observable<[Coin]>
}

final class CoinsRepositoryImpl {
    func getCoins(input: CoinsRequest) -> Observable<[Coin]> {
        return APICaller.shared.fetch(input: input)
            .map { (response: CoinsWelcome) in
                return response.data.coins
            }
            .catchErrorJustReturn([])
    }
}
