//
//  CoinDetailNavigator.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 06/11/2024.
//

import UIKit

protocol CoinDetailNavigatorType {
    
}

struct CoinDetailNavigator: CoinDetailNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
