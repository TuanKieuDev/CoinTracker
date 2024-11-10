//
//  PortfolioCollectionViewCell.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 16/05/2024.
//

import UIKit
import Reusable

final class PortfolioCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configView()
    }
    
    private func configView() {
        collectionView.do {
            $0.register(cellType: CoinPortfolioCollectionViewCell.self)
            $0.delegate = self
            $0.dataSource = self
        }
    }

}

extension PortfolioCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: CoinPortfolioCollectionViewCell.self)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return DesignSystem.CollectionCellSize.coinPortfolio
    }
}
