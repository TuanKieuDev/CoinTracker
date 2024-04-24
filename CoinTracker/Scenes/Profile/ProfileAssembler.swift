//
//  ProfileAssembler.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit
import Reusable

protocol ProfileAssembler {
    func resolve(navigationController: UINavigationController) -> ProfileViewController
    func resolve(navigationController: UINavigationController) -> ProfileViewModel
    func resolve(navigationController: UINavigationController) -> ProfileNavigatorType
    func resolve() -> ProfileUseCaseType
}

extension ProfileAssembler {
    func resolve(navigationController: UINavigationController) -> ProfileViewController {
        let vc = ProfileViewController.instantiate()
        let vm: ProfileViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> ProfileViewModel {
        return ProfileViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension ProfileAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> ProfileNavigatorType {
        return ProfileNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> ProfileUseCaseType {
        return ProfileUseCase()
    }
}
