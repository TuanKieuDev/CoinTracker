//
//  AppDelegate.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import UIKit
import RxSwift
import RxCocoa
import AppCenter
import AppCenterCrashes
import AppCenterAnalytics

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var assembler: Assembler = DefaultAssembler()
    var disposeBag = DisposeBag()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppCenter.start(withAppSecret: "b3297144-0ed3-425f-81ef-91a4c62743e5", services: [Analytics.self, Crashes.self])
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        bindViewModel(window: window)
        return true
    }
    
    private func bindViewModel(window: UIWindow) {
        let vm: AppViewModel = assembler.resolve(window: window)
        let input = AppViewModel.Input(load: Driver.just(()))
        _ = vm.transform(input, disposeBag: disposeBag)
    }
}
