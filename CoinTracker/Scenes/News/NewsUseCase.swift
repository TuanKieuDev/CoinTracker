//
//  NewsUseCase.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift

protocol NewsUseCaseType {
    func getNews() -> Observable<[News]>
}

struct NewsUseCase: NewsUseCaseType {
    func getNews() -> Observable<[News]> {
        return NewsRepositoryImpl().getNews(input: NewsRequest())
    }
}
