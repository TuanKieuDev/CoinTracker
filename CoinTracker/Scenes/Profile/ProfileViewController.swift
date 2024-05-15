//
//  ProfileViewController.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then

final class ProfileViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var logoutButton: AuthButton!
    
    // MARK: - Properties
    private var logoutTrigger = PublishSubject<Void>()
    
    var viewModel: ProfileViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Methods
    
    private func configView() {
        logoutButton.rx.tap.subscribe(
            onNext: {
                self.logoutTrigger.onNext(())
            }
        )
        .disposed(by: disposeBag)
    }
    
    func bindViewModel() {
        let input = ProfileViewModel.Input(logoutTrigger: logoutTrigger.asDriver(onErrorJustReturn: ()))
        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - Binders
extension ProfileViewController {
    
}

// MARK: - StoryboardSceneBased
extension ProfileViewController: StoryboardSceneBased {
    static var sceneStoryboard = Constants.Storyboards.profile
}