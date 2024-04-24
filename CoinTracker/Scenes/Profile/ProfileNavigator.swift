//
//  ProfileNavigator.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit

protocol ProfileNavigatorType {
    func toProfile()
}

struct ProfileNavigator: ProfileNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toProfile() {
        let vc: ProfileViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: false)
    }
}
