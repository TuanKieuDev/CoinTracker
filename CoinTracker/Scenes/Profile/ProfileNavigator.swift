//
//  ProfileNavigator.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit

protocol ProfileNavigatorType {
    func toProfile()
    func toLogin()
}

struct ProfileNavigator: ProfileNavigatorType, PresentLogin {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toProfile() {
        let vc: ProfileViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func toLogin() {
//        let vc: LoginViewController = assembler.resolve(window: UIWindow(), assembler: assembler)
//        navigationController.pushViewController(vc, animated: true)
//        let nav = BaseNavigationController()
//        let window = UIWindow(frame: UIScreen.main.bounds)
//        let vc: LoginViewController = assembler.resolve(window: window, assembler: assembler)
//        nav.viewControllers.append(vc)
//        
//        window.rootViewController = nav
//        window.makeKeyAndVisible()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let window = appDelegate.window else {
            return
        }

        return toLogin(window: window)
    }
}
