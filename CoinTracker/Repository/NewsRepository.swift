//
//  NewsRepository.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 05/11/2024.
//

import Foundation
import Alamofire
import RxSwift

protocol NewsRepository {
    func getNews(input: NewsRequest) -> Observable<[News]>
}

final class NewsRepositoryImpl {
    func getNews(input: NewsRequest) -> Observable<[News]> {
        return APICaller.shared.fetch(input: input)
            .map { (response: NewsWelcome) in
                return response.data
            }
            .catchErrorJustReturn([])
    }
}
