//
//  UIViewController+.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 15/05/2024.
//

import UIKit

extension UIViewController {
    func topMostViewController() -> UIViewController? {
        let vc = getTopMostViewController()
        
        return vc
    }
    
    private func getTopMostViewController() -> UIViewController? {
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController?.topMostViewController()
        }
        
        if let tab = self as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        
        if self.presentedViewController == nil {
            return self
        }
        if let navigation = self.presentedViewController as? UINavigationController {
            if let visibleController = navigation.visibleViewController {
                return visibleController.topMostViewController()
            }
        }
        if let tab = self.presentedViewController as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return self.presentedViewController?.topMostViewController()
    }
}
