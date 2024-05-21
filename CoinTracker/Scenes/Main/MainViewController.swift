//
//  MainViewController.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then

final class MainViewController: UITabBarController, Bindable {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    var viewModel: MainViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Methods
    
    private func configView() {
        
        // Customize the background color
               tabBar.barTintColor = UIColor.white
               
//               // Customize the shadow
//               tabBar.layer.shadowColor = UIColor.black.cgColor
//               tabBar.layer.shadowOffset = CGSize(width: 0, height: 2)
//               tabBar.layer.shadowRadius = 4
//               tabBar.layer.shadowOpacity = 0.3
//               tabBar.layer.masksToBounds = false
//        tabBar.layer.shadowPath = UIBezierPath(rect: tabBar.bounds).cgPath
               
               // Customize item color
               tabBar.tintColor = UIColor.blue
               tabBar.unselectedItemTintColor = UIColor.gray

    }
    
    func bindViewModel() {
        let input = MainViewModel.Input()
        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - Binders
extension MainViewController {
    
}

// MARK: - StoryboardSceneBased
extension MainViewController: StoryboardSceneBased {
    static var sceneStoryboard = Constants.Storyboards.main
}
