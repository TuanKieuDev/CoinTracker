//
//  ProfileViewModel.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift
import RxCocoa

struct ProfileViewModel {
    let navigator: ProfileNavigatorType
    let useCase: ProfileUseCaseType
}

// MARK: - ViewModel
extension ProfileViewModel: ViewModel {
    struct Input {
        let logoutTrigger: Driver<Void>
    }
    
    struct Output {
        
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        
        input.logoutTrigger

            .drive(onNext: {
                self.navigator.toLogin()
            })
            .disposed(by: disposeBag)
        
        return Output()
    }
}
