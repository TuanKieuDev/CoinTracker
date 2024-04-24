//
//  NewsViewModel.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift
import RxCocoa

struct NewsViewModel {
    let navigator: NewsNavigatorType
    let useCase: NewsUseCaseType
}

// MARK: - ViewModel
extension NewsViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        return output
    }
}
