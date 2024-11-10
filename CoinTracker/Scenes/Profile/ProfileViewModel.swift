//
//  ProfileViewModel.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift
import RxCocoa
import RxSwiftUtilities

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
        let isLoggingOut: Driver<Bool>
//        let logoutSuccess: Driver<Void>
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let activityIndicator = ActivityIndicator()
        
        input.logoutTrigger
            .asObservable()
            .flatMapLatest {
                self.useCase.signOut()
                    .trackActivity(activityIndicator)  // Track loading state
                    .asDriverOnErrorJustComplete()
            }
            .subscribe(onNext: { _ in
                print("AA_toLogin")
//                self.navigator.toLogin()  // Navigate to login after successful logout
            })
            .disposed(by: disposeBag)
        
        return Output(
            isLoggingOut: activityIndicator.asDriver()
        )
    }
}
