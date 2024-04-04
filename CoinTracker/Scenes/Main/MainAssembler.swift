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
//        let forecastNavigation = BaseNavigationController()
//        let settingsNavigation = BaseNavigationController()

        let homeNavigator: HomeNavigatorType = assembler.resolve(navigationController: homeNavigation)
        homeNavigator.toHome()
        
//        let forecastNavigator: ForecastNavigatorType = assembler.resolve(navigationController: forecastNavigation)
//        forecastNavigator.toForecast()
//
//        let settingsNavigator: SettingsNavigatorType = assembler.resolve(navigationController: settingsNavigation)
//        settingsNavigator.toSettings()
        
        homeNavigation.isNavigationBarHidden = true
//        forecastNavigation.isNavigationBarHidden = true
//        settingsNavigation.isNavigationBarHidden = true
        
        homeNavigation.tabBarItem = TabBarItemType.home.tabbarItem
//        forecastNavigation.tabBarItem = TabBarItemType.forecast.tabbarItem
//        settingsNavigation.tabBarItem = TabBarItemType.settings.tabbarItem

        vc.viewControllers = [
            homeNavigation
//            forecastNavigation,
//            settingsNavigation
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
