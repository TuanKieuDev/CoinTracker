//
//  LoginNavigator.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit

protocol LoginNavigatorType {
    func toMain()
    func toRegister()
}

struct LoginNavigator: LoginNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    unowned let window: UIWindow
    
    func toLogin() {
        let vc: LoginViewController = assembler.resolve(window: window, navigationController: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func toMain() {
        let navigator: MainNavigatorType = assembler.resolve(window: window)
        navigator.toMain()
    }
    
    func toRegister() {
        let nav = BaseNavigationController()
        let vc: RegisterViewController = assembler.resolve(navigationController: nav)
        nav.pushViewController(vc, animated: true)
    }
}
