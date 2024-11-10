//
//  CoinDetailViewController.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 06/11/2024.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then

final class CoinDetailViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    var viewModel: CoinDetailViewModel!
    var disposeBag = DisposeBag()
    
    var coin: Coin?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    deinit {
        logDeinit()
    }
    
    // MARK: - Methods
    
    private func configView() {
        
    }
    
    func bindViewModel() {
        let input = CoinDetailViewModel.Input()
        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - Binders
extension CoinDetailViewController {
    
}

// MARK: - StoryboardSceneBased
extension CoinDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = UIStoryboard()
}
