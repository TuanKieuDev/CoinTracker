//
//  CoinDetailViewModel.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 06/11/2024.
//

import RxSwift
import RxCocoa

struct CoinDetailViewModel {
    let navigator: CoinDetailNavigatorType
    let useCase: CoinDetailUseCaseType
}

// MARK: - ViewModel
extension CoinDetailViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        return output
    }
}
