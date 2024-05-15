//
//  AppNavigator.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import UIKit

protocol AppNavigatorType {
    func toMain()
    func toLogin()
}

struct AppNavigator: AppNavigatorType {
    unowned let assembler: Assembler
    unowned let window: UIWindow
    
    func toMain() {
        let nav = BaseNavigationController()
        let vc: MainViewController = assembler.resolve(window: window, assembler: assembler)
        nav.viewControllers.append(vc)
        
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
    
    func toLogin() {
        let nav = BaseNavigationController()
        let vc: LoginViewController = assembler.resolve(window: window, navigationController: nav)
        nav.viewControllers.append(vc)
        
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
