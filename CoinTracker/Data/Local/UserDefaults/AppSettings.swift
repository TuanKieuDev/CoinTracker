//
//  AppSettings.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import UIKit

enum AppSettings {
    
    @Storage(key: "didInit", defaultValue: false)
    static var didInit: Bool
}
