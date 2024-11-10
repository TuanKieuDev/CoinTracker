//
//  LoginViewModel.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift
import RxCocoa
import RxSwiftUtilities
import GoogleSignIn
import FirebaseAuth

struct LoginViewModel {
    let navigator: LoginNavigatorType
    let useCase: LoginUseCaseType
}

// MARK: - ViewModel
extension LoginViewModel: ViewModel {
    struct Input {
        let email: Driver<String>
        let password: Driver<String>
        let normalLoginTrigger: Driver<Void>
        let googleLoginTrigger: Driver<Void>
    }
    
    struct Output {
        let isLoading: Driver<Bool>
        let loginSuccess: Driver<Void>
    }
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output {
        let activityIndicator = ActivityIndicator()
        
        input.normalLoginTrigger.withLatestFrom(Driver.combineLatest(input.email, input.password))
            .flatMapLatest { email, password in
                return self.useCase.signInWithEmail(email: email, password: password)
                    .trackActivity(activityIndicator)
                    .do(onNext: { _ in
                        print("toMain")
                        self.navigator.toMain()
                    })
                    .asDriverOnErrorJustComplete()
                
            }
            .drive()
            .disposed(by: disposeBag)
        
        input.googleLoginTrigger
            .flatMapLatest {
                return self.useCase.signInWithGoogle()
                    .flatMapLatest { user in
                        self.useCase.firebaseLogin(withGoogleUser: user)
                    }
                    .trackActivity(activityIndicator)
                    .asDriverOnErrorJustComplete()
            }
            .drive(onNext: {
                self.navigator.toMain()
            })
            .disposed(by: disposeBag)
        
        return Output(
            isLoading: activityIndicator.asDriver(),
            loginSuccess: input.googleLoginTrigger
        )
    }
}
