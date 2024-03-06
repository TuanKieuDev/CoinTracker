//
//  AppUseCase.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import RxSwift

protocol AppUseCaseType {
}

struct AppUseCase: AppUseCaseType {
    let appGateway: AppGatewayType
}
