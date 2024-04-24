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
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        configView()
    }
    
    // MARK: - Methods
    
//    private func configView() {
//        collectionView.do {
//            $0.register(cellType: CurrentWeatherCollectionViewCell.self)
//        }
//
//        collectionView.do {
//            $0.delegate = self
//            $0.dataSource = self
//        }
//    }
    
    func bindViewModel() {
        let input = HomeViewModel.Input()
        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - Binders
extension HomeViewController {
    
}

// MARK: - StoryboardSceneBased
extension HomeViewController: StoryboardSceneBased {
    static var sceneStoryboard = Constants.Storyboards.home
}
