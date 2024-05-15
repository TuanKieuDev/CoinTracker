//
//  RegisterViewModel.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift
import RxCocoa

struct RegisterViewModel {
    let navigator: RegisterNavigatorType
    let useCase: RegisterUseCaseType
}

// MARK: - ViewModel
extension RegisterViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let output = Output()
        return output
    }
}
