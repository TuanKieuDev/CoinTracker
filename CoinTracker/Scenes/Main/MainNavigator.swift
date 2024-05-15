//
//  MainNavigator.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import UIKit

protocol MainNavigatorType {
    func toMain()
}

struct MainNavigator: MainNavigatorType {
    unowned let assembler: Assembler
    unowned let window: UIWindow
    
    func toMain() {
        let vc: MainViewController = assembler.resolve(window: window, assembler: assembler)
        let navigation = BaseNavigationController()
        navigation.viewControllers.append(vc)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
}
