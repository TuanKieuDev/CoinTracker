//
//  RegisterNavigator.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit

protocol RegisterNavigatorType {
    
}

struct RegisterNavigator: RegisterNavigatorType {
    unowned let assembler: Assembler
    unowned let navigationController: UINavigationController
}
