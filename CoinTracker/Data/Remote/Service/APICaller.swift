//
//  APICaller.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 29/10/2024.
//

import Foundation
import Alamofire
import RxSwift

final class APICaller {
    static let shared = APICaller()

    private init() {}

    func fetch <T: Codable> (input: BaseRequest) -> Observable<T> {
        return Observable.create { observable in
            AF.request(input.url, method: input.requestType, parameters: input.parameter, encoding: URLEncoding.default, headers: input.headers)
                .response { (response) in
                    guard let data = response.data else { return }
                    
                    let decoder = JSONDecoder()
                    do {
                        switch response.result {
                        case .success:
                            let returnedResponse = try decoder.decode(T.self, from: data)
                            observable.onNext(returnedResponse)
                            observable.onCompleted()
                        case .failure(let error):
                            observable.onError(error)
                        }
                    } catch {
                        observable.onError(error)
                    }
                }
            return Disposables.create()
        }
    }
}
