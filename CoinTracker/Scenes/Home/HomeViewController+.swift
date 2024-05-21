//
//  HomeViewController+.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: PortfolioCollectionViewCell.self)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: TradeCollectionViewCell.self)
            
            return cell
        }
    }
    
}
