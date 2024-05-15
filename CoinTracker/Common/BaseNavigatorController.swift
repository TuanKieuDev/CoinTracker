//
//  BaseNavigatorController.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import Foundation
import UIKit
import Then

final class BaseNavigationController: UINavigationController {
        
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? .portrait
    }
    
    // MARK: - Private functions
    private func config() {
        delegate = self
        navigationBar.do {
            $0.isHidden = true
        }
    }
}

extension BaseNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        viewController.extendedLayoutIncludesOpaqueBars = true
//        viewController.removeBackButtonTitle()
    }
}
