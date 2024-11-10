//
//  HomeUseCase.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import RxSwift

protocol HomeUseCaseType {
    func getCoins() -> Observable<[Coin]>
}

struct HomeUseCase: HomeUseCaseType {
    func getCoins() -> Observable<[Coin]> {
        return CoinsRepositoryImpl().getCoins(input: CoinsRequest())
    }
}
