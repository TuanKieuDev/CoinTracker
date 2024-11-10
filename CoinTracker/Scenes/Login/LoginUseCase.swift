//
//  LoginUseCase.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import RxSwift
import FirebaseAuth
import GoogleSignIn
import FirebaseCore

protocol LoginUseCaseType {
    func signInWithEmail(email: String, password: String) -> Observable<User>
    func signInWithGoogle() -> Observable<GIDGoogleUser>
    func firebaseLogin(withGoogleUser user: GIDGoogleUser) -> Observable<Void>
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
    
    func signInWithGoogle() -> Observable<GIDGoogleUser> {
        return Observable.create { observer in
            guard let clientID = FirebaseApp.app()?.options.clientID else {
                observer.onError(NSError(domain: "GoogleSignIn", code: 0, userInfo: [NSLocalizedDescriptionKey: "No Firebase client ID"]))
                return Disposables.create()
            }
            
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config
            
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
                GIDSignIn.sharedInstance.signIn(withPresenting: keyWindow.rootViewController!) { result, error in
                    if let error = error {
                        observer.onError(error)
                    } else if let user = result?.user {
                        observer.onNext(user)
                        observer.onCompleted()
                    }
                }
            }
            return Disposables.create()
        }
    }
    
    func firebaseLogin(withGoogleUser user: GIDGoogleUser) -> Observable<Void> {
        return Observable.create { observer in
            guard let idToken = user.idToken?.tokenString else {
                observer.onError(NSError(domain: "GoogleSignIn", code: 0, userInfo: [NSLocalizedDescriptionKey: "No Google authentication token"]))
                return Disposables.create()
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    observer.onError(error)
                } else {
                    observer.onNext(())
                    observer.onCompleted()
                }
            }
            return Disposables.create()
        }
    }
}
