//
//  ProfileUseCase.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift
import FirebaseAuth

protocol ProfileUseCaseType {
    func signOut() -> Observable<Void>
}

struct ProfileUseCase: ProfileUseCaseType {
    func signOut() -> Observable<Void> {
        return Observable.create { observer in
            do {
                try Auth.auth().signOut()
                observer.onNext(())
                observer.onCompleted()
            } catch let signOutError as NSError {
                observer.onError(signOutError)
            }
            return Disposables.create()
        }
    }
}
