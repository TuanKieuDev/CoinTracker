//
//  PresentLogin.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 15/05/2024.
//

import Foundation
import UIKit

protocol PresentLogin {
    var assembler: Assembler { get }
    var navigationController: UINavigationController { get }
}

extension PresentLogin {
    private func presentViewController(window: UIWindow) {
        let rootNav = BaseNavigationController()
        _ = rootNav.view // use to call viewDidLoad
        let vc: LoginViewController = assembler.resolve(window: window, navigationController: rootNav)
        rootNav.viewControllers.append(vc)
        rootNav.isNavigationBarHidden = false
        rootNav.modalPresentationStyle = .fullScreen
        navigationController.topMostViewController()?.present(rootNav, animated: true, completion: nil)
    }
    
    func toLogin(window: UIWindow) {
        presentViewController(window: window)
    }
}
