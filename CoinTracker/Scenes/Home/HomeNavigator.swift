//
//  HomeNavigator.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import UIKit

protocol HomeNavigatorType {
    func toHome()
    func toDetail(coin: Coin)
}

struct HomeNavigator: HomeNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toHome() {
        let vc: HomeViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func toDetail(coin: Coin) {
        let useCase = CoinDetailUseCase()
        let navigator = CoinDetailNavigator(assembler: assembler, navigationController: navigationController)
        let viewModel = CoinDetailViewModel(navigator: navigator, useCase: useCase)
        let vc = CoinDetailViewController().then {
            $0.coin = coin
            $0.bindViewModel(to: viewModel)
        }
        navigationController.pushViewController(vc, animated: true)
    }
}
