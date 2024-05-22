//
//  AppViewModel.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import RxSwift
import RxCocoa

struct AppViewModel {
    let navigator: AppNavigatorType
    let useCase: AppUseCaseType
}

// MARK: - ViewModel
extension AppViewModel: ViewModel {
    struct Input {
        let load: Driver<Void>
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        input.load
            .drive(onNext:
                    self.navigator.toLogin
            )
            .disposed(by: disposeBag)
        
        return Output()
    }
}
