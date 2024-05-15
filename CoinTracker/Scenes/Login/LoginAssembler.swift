//
//  LoginAssembler.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit
import Reusable

protocol LoginAssembler {
    func resolve(window: UIWindow, navigationController: UINavigationController) -> LoginViewController
    func resolve(window: UIWindow, navigationController: UINavigationController) -> LoginViewModel
    func resolve(window: UIWindow,  navigationController: UINavigationController) -> LoginNavigatorType
    func resolve() -> LoginUseCaseType
}

extension LoginAssembler {
    func resolve(window: UIWindow, navigationController: UINavigationController) -> LoginViewController {
        let vc = LoginViewController.instantiate()
        let vm: LoginViewModel = resolve(window: window, navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(window: UIWindow, navigationController: UINavigationController) -> LoginViewModel {
        return LoginViewModel(
            navigator: resolve(window: window, navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension LoginAssembler where Self: DefaultAssembler {
    func resolve(window: UIWindow, navigationController: UINavigationController) -> LoginNavigatorType {
        return LoginNavigator(assembler: self, navigationController: navigationController, window: window)
    }
    
    func resolve() -> LoginUseCaseType {
        return LoginUseCase()
    }
}
