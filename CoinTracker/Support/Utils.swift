//
//  Utils.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import Foundation

func after(interval: TimeInterval, completion: (() -> Void)?) {
    DispatchQueue.main.asyncAfter(deadline: .now() + interval) {
        completion?()
    }
}
