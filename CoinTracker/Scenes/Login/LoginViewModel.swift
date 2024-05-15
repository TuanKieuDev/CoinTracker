//
//  LoginViewModel.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift
import RxCocoa

struct LoginViewModel {
    let navigator: LoginNavigatorType
    let useCase: LoginUseCaseType
}

// MARK: - ViewModel
extension LoginViewModel: ViewModel {
    struct Input {
        let normalLoginTrigger: Driver<Void>
    }
    
    struct Output {
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        
        input.normalLoginTrigger
//            .withLatestFrom(anime) { indexPath, result in
//                return result[indexPath.row]
//            }
            .drive(onNext: {
                self.navigator.toMain()
            })
            .disposed(by: disposeBag)
        
        return Output()
    }
}
