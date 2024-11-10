//
//  HomeViewController+.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import Foundation
import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == Constants.Home.Section.portfolio.rawValue {
            return DesignSystem.CollectionCellSize.portfolio(collectionView: collectionView)
        } else {
            return DesignSystem.CollectionCellSize.trade(collectionView: collectionView)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == Constants.Home.Section.portfolio.rawValue {
            return 0
        }
        return coinsList.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: Constants.SectionHeaderView.home,
            for: indexPath)
        
        let paddingHorizontal = DesignSystem.Padding.horizontal
        
        let titleLabel = UILabel(frame: CGRect(x: paddingHorizontal,
                                               y: paddingHorizontal,
                                               width: headerView.bounds.width - paddingHorizontal * 2,
                                               height: headerView.bounds.height))
        let sectionTitles = Constants.Home.SectionTitle.allCases
        
        titleLabel.text = sectionTitles[indexPath.section].rawValue
        titleLabel.font = UIFont(name: "Avenir", size: 30)
        
        headerView.addSubview(titleLabel)
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 70)  // Adjust height as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == Constants.Home.Section.portfolio.rawValue {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: PortfolioCollectionViewCell.self)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: TradeCollectionViewCell.self)
            cell.configView(coin: coinsList[indexPath.row])
            return cell
        }
    }
}
