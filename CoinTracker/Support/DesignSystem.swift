//
//  DesignSystem.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 17/10/2024.
//

import Foundation
import UIKit

struct DesignSystem {
    enum Colors {
    }
    
    enum CollectionCellSize {
        static let coinPortfolio = CGSize(width: 300, height: 200)
        
        static func portfolio(collectionView: UICollectionView) -> CGSize {
            let width = collectionView.frame.width
            return CGSize(width: width - 32, height: 210)
        }
        
        static func trade(collectionView: UICollectionView) -> CGSize {
            let width = collectionView.frame.width
            return CGSize(width: width - 32, height: 120)
        }
    }
    
    struct Padding {
        static let horizontal = CGFloat(16)
        static let vertical = CGFloat(8)
    }
}
