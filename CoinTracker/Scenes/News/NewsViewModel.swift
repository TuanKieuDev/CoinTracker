//
//  NewsViewModel.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift
import RxCocoa
import RxSwiftUtilities

struct NewsViewModel {
    let navigator: NewsNavigatorType
    let useCase: NewsUseCaseType
}

// MARK: - ViewModel
extension NewsViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        let news: Driver<[News]>
        let isLoading: Driver<Bool>
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let activityIndicator = ActivityIndicator()
        
        let news = input.load
            .flatMapLatest { _ in
                return self.useCase.getNews()
                    .trackActivity(activityIndicator)
                    .asDriver(onErrorJustReturn: [])
            }

        return Output(news: news, isLoading: activityIndicator.asDriver())
    }
}
