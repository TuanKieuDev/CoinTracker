//
//  NewsAssembler.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit
import Reusable

protocol NewsAssembler {
    func resolve(navigationController: UINavigationController) -> NewsViewController
    func resolve(navigationController: UINavigationController) -> NewsViewModel
    func resolve(navigationController: UINavigationController) -> NewsNavigatorType
    func resolve() -> NewsUseCaseType
}

extension NewsAssembler {
    func resolve(navigationController: UINavigationController) -> NewsViewController {
        let vc = NewsViewController.instantiate()
        let vm: NewsViewModel = resolve(navigationController: navigationController)
        vc.bindViewModel(to: vm)
        return vc
    }
    
    func resolve(navigationController: UINavigationController) -> NewsViewModel {
        return NewsViewModel(
            navigator: resolve(navigationController: navigationController),
            useCase: resolve()
        )
    }
}

extension NewsAssembler where Self: DefaultAssembler {
    func resolve(navigationController: UINavigationController) -> NewsNavigatorType {
        return NewsNavigator(assembler: self, navigationController: navigationController)
    }
    
    func resolve() -> NewsUseCaseType {
        return NewsUseCase()
    }
}
