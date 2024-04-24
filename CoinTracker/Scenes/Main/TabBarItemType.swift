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
    case news
    case exchange
    case profile

    static var allValues: [TabBarItemType] {
        return TabBarItemType.allCases
    }
}

extension TabBarItemType {
    var image: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house")
        case .news:
            return UIImage(systemName: "newspaper")
        case .exchange:
            return UIImage(systemName: "bitcoinsign.arrow.circlepath")
        case .profile:
            return UIImage(systemName: "person")
        }
    }
    
    var title: String? {
        switch self {
        case .home:
            return Constants.TabBar.home
        case .news:
            return Constants.TabBar.news
        case .exchange:
            return Constants.TabBar.exchange
        case .profile:
            return Constants.TabBar.profile
        }
    }
    
    var tabbarItem: UITabBarItem {
        return UITabBarItem(title: title, image: image, selectedImage: image)
    }
}
