//
//  LoginUseCase.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift
import FirebaseAuth

protocol LoginUseCaseType {
    func signInWithEmail(email: String, password: String) -> Observable<User>
}

struct LoginUseCase: LoginUseCaseType {
    func signInWithEmail(email: String, password: String) -> Observable<User> {
        return Observable.create { observer in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    observer.onError(error)
                } else if let user = authResult?.user {
                    observer.onNext(user)
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}
