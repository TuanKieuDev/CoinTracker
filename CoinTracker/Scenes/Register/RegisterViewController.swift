//
//  RegisterViewController.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then

final class RegisterViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    
    var viewModel: RegisterViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Methods
    
    private func configView() {
        
    }
    
    func bindViewModel() {
        let input = RegisterViewModel.Input()
        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - Binders
extension RegisterViewController {
    
}

// MARK: - StoryboardSceneBased
extension RegisterViewController: StoryboardSceneBased {
    static var sceneStoryboard = Constants.Storyboards.register
}
