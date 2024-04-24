//
//  ExchangeViewModel.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift
import RxCocoa

struct ExchangeViewModel {
    let navigator: ExchangeNavigatorType
    let useCase: ExchangeUseCaseType
}

// MARK: - ViewModel
extension ExchangeViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        return output
    }
}
