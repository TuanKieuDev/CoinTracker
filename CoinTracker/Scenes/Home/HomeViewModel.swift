//
//  HomeViewModel.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import RxSwift
import RxCocoa

struct HomeViewModel {
    let navigator: HomeNavigatorType
    let useCase: HomeUseCaseType
}

// MARK: - ViewModel
extension HomeViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        return output
    }
}
