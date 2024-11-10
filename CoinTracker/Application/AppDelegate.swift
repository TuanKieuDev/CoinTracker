//
//  AppDelegate.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import UIKit
import RxSwift
import RxCocoa
import FirebaseCore
import GoogleSignIn

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var assembler: Assembler = DefaultAssembler()
    var disposeBag = DisposeBag()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        FirebaseApp.configure()
        bindViewModel(window: window)
        return true
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
    
    private func bindViewModel(window: UIWindow) {
        let vm: AppViewModel = assembler.resolve(window: window)
        let input = AppViewModel.Input(load: Driver.just(()))
        _ = vm.transform(input, disposeBag: disposeBag)
    }
}
