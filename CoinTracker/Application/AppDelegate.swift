//
//  AppDelegate.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
//        bindViewModel(window: window)
        return true
    }
    
    private func bindViewModel(window: UIWindow) {
//        let vm: AppViewModel = assembler.resolve(window: window)
//        let input = AppViewModel.Input(load: Driver.just(()))
//        _ = vm.transform(input, disposeBag: disposeBag)
    }
}

