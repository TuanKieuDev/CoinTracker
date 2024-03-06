//
//  AppGateway.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import UIKit

protocol AppGatewayType {
    func checkFirstRun() -> Bool
    func setFirstRun()
}

struct AppGateway: AppGatewayType {
    func checkFirstRun() -> Bool {
        return !AppSettings.didInit
    }
    
    func setFirstRun() {
        AppSettings.didInit = true
    }
}
