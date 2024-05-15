//
//  MainAssembler.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import UIKit

protocol MainAssembler {
    func resolve(window: UIWindow, assembler: Assembler) -> MainViewController
    func resolve(window: UIWindow) -> MainViewModel
    func resolve(window: UIWindow) -> MainNavigatorType
    func resolve() -> MainUseCaseType
}

extension MainAssembler {
    func resolve(window: UIWindow, assembler: Assembler) -> MainViewController {
        let vc = MainViewController.instantiate()
        let vm: MainViewModel = resolve(window: window)
        vc.bindViewModel(to: vm)
        
        let homeNavigation = BaseNavigationController()
        let homeNavigator: HomeNavigatorType = assembler.resolve(navigationController: homeNavigation)
        homeNavigator.toHome()
        
        let newsNavigation = BaseNavigationController()
        let newsNavigator: NewsNavigatorType = assembler.resolve(navigationController: newsNavigation)
        newsNavigator.toNews()
        
        let exchangeNavigation = BaseNavigationController()
        let exchangeNavigator: ExchangeNavigatorType = assembler.resolve(navigationController: exchangeNavigation)
        exchangeNavigator.toExchange()
        
        let profileNavigation = BaseNavigationController()
        let profileNavigator: ProfileNavigatorType = assembler.resolve(navigationController: profileNavigation)
        profileNavigator.toProfile()
        
        homeNavigation.isNavigationBarHidden = true
        newsNavigation.isNavigationBarHidden = true
        exchangeNavigation.isNavigationBarHidden = true
        profileNavigation.isNavigationBarHidden = true
        
        homeNavigation.tabBarItem = TabBarItemType.home.tabbarItem
        newsNavigation.tabBarItem = TabBarItemType.news.tabbarItem
        exchangeNavigation.tabBarItem = TabBarItemType.exchange.tabbarItem
        profileNavigation.tabBarItem = TabBarItemType.profile.tabbarItem

        vc.viewControllers = [
            homeNavigation,
            newsNavigation,
            exchangeNavigation,
            profileNavigation
        ]
        
        return vc
    }

    func resolve(window: UIWindow) -> MainViewModel {
        return MainViewModel(
            navigator: resolve(window: window),
            useCase: resolve()
        )
    }
}

extension MainAssembler where Self: DefaultAssembler {
    func resolve(window: UIWindow) -> MainNavigatorType {
        return MainNavigator(assembler: self, window: window)
    }

    func resolve() -> MainUseCaseType {
        return MainUseCase()
    }
}
