//
//  ExchangeAssembler.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit
import Reusable

protocol ExchangeAssembler {
    func resolve(navigationController: UINavigationController) -> ExchangeViewController
    func resolve(navigationController: UINavigationController) -> ExchangeViewModel
    func resolve(navigationController: UINavigationController) -> ExchangeNavigatorType
    func resolve() -> ExchangeUseCaseType
}

extension ExchangeAssembler {
    func resolve(navigationController: UINavigationController) -> ExchangeViewController {
        let vc = ExchangeViewController.instantiate()
        let vm: ExchangeViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> ExchangeViewModel {
        return ExchangeViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension ExchangeAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> ExchangeNavigatorType {
        return ExchangeNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> ExchangeUseCaseType {
        return ExchangeUseCase()
    }
}
