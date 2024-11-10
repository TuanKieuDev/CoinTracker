//
//  Constants.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import UIKit

struct Constants {
    struct Storyboards {
        static let main = UIStoryboard(name: "Main", bundle: nil)
        static let home = UIStoryboard(name: "Home", bundle: nil)
        static let news = UIStoryboard(name: "News", bundle: nil)
        static let exchange = UIStoryboard(name: "Exchange", bundle: nil)
        static let profile = UIStoryboard(name: "Profile", bundle: nil)
        static let login = UIStoryboard(name: "Login", bundle: nil)
        static let register = UIStoryboard(name: "Register", bundle: nil)
    }
    
    struct TabBar {
        static let home = "Home"
        static let news = "News"
        static let exchange = "Exchange"
        static let profile = "Profile"
    }
    
    struct Home {
        enum Section: Int, CaseIterable {
            case portfolio = 0
            case trade = 1
        }
        
        enum SectionTitle: String, CaseIterable {
            case portfolios = "Portfolios"
            case trades = "Trades"
        }
    }
    
    struct Profile {
        enum Section: String, CaseIterable {
            case account = "My Account"
            case preferences = "Preferences"
            case help = "Help Center"
            case community = "Community"
        }
    }

    struct SectionHeaderView {
        static let home = "HomeSectionHeader"
        static let news = "NewsSectionHeader"
        static let exchange = "ExchangeSectionHeader"
    }
}
