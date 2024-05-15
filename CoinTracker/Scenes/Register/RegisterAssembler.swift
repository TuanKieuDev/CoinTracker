//
//  RegisterAssembler.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit
import Reusable

protocol RegisterAssembler {
    func resolve(navigationController: UINavigationController) -> RegisterViewController
    func resolve(navigationController: UINavigationController) -> RegisterViewModel
    func resolve(navigationController: UINavigationController) -> RegisterNavigatorType
    func resolve() -> RegisterUseCaseType
}

extension RegisterAssembler {
    func resolve(navigationController: UINavigationController) -> RegisterViewController {
        let vc = RegisterViewController.instantiate()
        let vm: RegisterViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> RegisterViewModel {
        return RegisterViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension RegisterAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> RegisterNavigatorType {
        return RegisterNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> RegisterUseCaseType {
        return RegisterUseCase()
    }
}
