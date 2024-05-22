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
    @IBOutlet private weak var emailTextField: AuthTextField!
    @IBOutlet private weak var passwordTextField: AuthTextField!
    
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
        
    }
    
    func bindViewModel() {
        let input = LoginViewModel.Input(
            email: emailTextField.rx.text.orEmpty.asDriver(),
            password: passwordTextField.rx.text.orEmpty.asDriver(),
            normalLoginTrigger: normalLoginButton.rx.tap.asDriver()
        )
        
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
