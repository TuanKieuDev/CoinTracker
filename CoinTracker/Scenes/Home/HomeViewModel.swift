//
//  HomeViewModel.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import RxSwift
import RxCocoa
import RxSwiftUtilities

struct HomeViewModel {
    let navigator: HomeNavigatorType
    let useCase: HomeUseCaseType
}

// MARK: - ViewModel
extension HomeViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        let coins: Driver<[Coin]>
        let isLoading: Driver<Bool>
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let activityIndicator = ActivityIndicator()
        
        let coins = input.load
            .flatMapLatest { _ in
                return self.useCase.getCoins()
                    .trackActivity(activityIndicator)
                    .asDriver(onErrorJustReturn: [])
            }

        return Output(coins: coins, isLoading: activityIndicator.asDriver())
    }
}
