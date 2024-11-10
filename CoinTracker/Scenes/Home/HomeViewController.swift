//
//  HomeViewController.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then

final class HomeViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel!
    var disposeBag = DisposeBag()
    var coinsList = [Coin]()
    let sections = Constants.Home.Section.allCases
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Methods
    
    private func configView() {
        collectionView.do {
            $0.register(cellType: PortfolioCollectionViewCell.self)
            $0.register(cellType: TradeCollectionViewCell.self)
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    func bindViewModel() {
        let input = HomeViewModel.Input(load: Driver.just(()))
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.coins
            .asDriver()
            .drive(onNext: { [unowned self] coins in
                self.coinsList = coins
                print("AA_\(coinsList)")
                self.collectionView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension HomeViewController {
    
}

// MARK: - StoryboardSceneBased
extension HomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = Constants.Storyboards.home
}
