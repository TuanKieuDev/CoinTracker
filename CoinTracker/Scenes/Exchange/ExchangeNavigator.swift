//
//  ExchangeNavigator.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit

protocol ExchangeNavigatorType {
    func toExchange()
}

struct ExchangeNavigator: ExchangeNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
    
    func toExchange() {
        let vc: ExchangeViewController = assembler.resolve(navigationController: navigationController)
        navigationController.pushViewController(vc, animated: false)
    }
}
