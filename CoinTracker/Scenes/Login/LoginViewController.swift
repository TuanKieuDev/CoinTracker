//
//  LoginViewController.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then

final class LoginViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var normalLoginButton: AuthButton!
    @IBOutlet private weak var googleLoginButton: BorderedButton!
    
    // MARK: - Properties
    private var normalLoginTrigger = PublishSubject<Void>()
    
    var viewModel: LoginViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Methods
    
    private func configView() {
        normalLoginButton.rx.tap.subscribe(
            onNext: {
                self.normalLoginTrigger.onNext(())
            }
        )
        .disposed(by: disposeBag)
    }
    
    func bindViewModel() {
        let input = LoginViewModel.Input(normalLoginTrigger: normalLoginTrigger.asDriver(onErrorJustReturn: ()))
        let output = viewModel.transform(input, disposeBag: disposeBag)
    }
}

// MARK: - Binders
extension LoginViewController {
    
}

// MARK: - StoryboardSceneBased
extension LoginViewController: StoryboardSceneBased {
    static var sceneStoryboard = Constants.Storyboards.login
}
