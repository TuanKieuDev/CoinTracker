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
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var logoutTrigger = PublishSubject<Void>()
    var viewModel: ProfileViewModel!
    var disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }
    
    // MARK: - Methods
    
    private func configView() {
        tableView.do {
            $0.showsVerticalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: GeneralInformationTableViewCell.self)
            $0.register(cellType: CategoryInformationTableViewCell.self)
            $0.register(cellType: LogoutButtonTableViewCell.self)
        }
//        logoutButton.rx.tap.subscribe(
//            onNext: {
//                self.logoutTrigger.onNext(())
//            }
//        )
//        .disposed(by: disposeBag)
        
//        logoutButton.rx.tap
//                   .bind(to: logoutTrigger)
//                   .disposed(by: disposeBag)
    }
    
    func bindViewModel() {
        let input = ProfileViewModel.Input(logoutTrigger: logoutTrigger.asDriver(onErrorJustReturn: ()))

        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.isLoggingOut
            .drive(onNext: { isLoading in
                if isLoading {
                    print("isLogging")
                } else {
                    print("login out")
                }
            })
            .disposed(by: disposeBag)
//        
//        output.logoutSuccess
//            .drive()
//            .disposed(by: disposeBag)
    }
}

// MARK: - Binders
extension ProfileViewController {
    
}

// MARK: - StoryboardSceneBased
extension ProfileViewController: StoryboardSceneBased {
    static var sceneStoryboard = Constants.Storyboards.profile
}
