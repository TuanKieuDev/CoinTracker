//
//  TabBarItemType.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import Foundation
import UIKit

enum TabBarItemType: CaseIterable {
    case home
    case forecast
    case settings

    static var allValues: [TabBarItemType] {
        return TabBarItemType.allCases
    }
}

extension TabBarItemType {
    var image: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house")
        case .forecast:
            return UIImage(systemName: "radio")
        case .settings:
            return UIImage(systemName: "slider.vertical.3")
        }
    }
    
    var title: String? {
        switch self {
        case .home:
            return Constants.TabBar.home
        case .forecast:
            return Constants.TabBar.forecast
        case .settings:
            return Constants.TabBar.settings
        }
    }
    
    var tabbarItem: UITabBarItem {
        return UITabBarItem(title: title, image: image, selectedImage: image)
    }
}
