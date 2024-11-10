//
//  CoinDetailAssembler.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 06/11/2024.
//

import UIKit
import Reusable

protocol CoinDetailAssembler {
    func resolve(navigationController: UINavigationController) -> CoinDetailViewController
    func resolve(navigationController: UINavigationController) -> CoinDetailViewModel
    func resolve(navigationController: UINavigationController) -> CoinDetailNavigatorType
    func resolve() -> CoinDetailUseCaseType
}

extension CoinDetailAssembler {
    func resolve(navigationController: UINavigationController) -> CoinDetailViewController {
        let vc = CoinDetailViewController.instantiate()
        let vm: CoinDetailViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> CoinDetailViewModel {
        return CoinDetailViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension CoinDetailAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> CoinDetailNavigatorType {
        return CoinDetailNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> CoinDetailUseCaseType {
        return CoinDetailUseCase()
    }
}
