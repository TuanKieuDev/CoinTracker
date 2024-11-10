//
//  NewsViewController.swift
//  CoinTracker
//
//  Created by kieu.anh.tuanb on 24/04/2024.
//

import UIKit
import RxSwift
import RxCocoa
import Reusable
import Then

final class NewsViewController: UIViewController, Bindable {
    
    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var viewModel: NewsViewModel!
    var disposeBag = DisposeBag()
    var newsList = [News]()
    var filterTrigger = PublishSubject<Void>()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    // MARK: - Methods
    
    private func configView() {
        tableView.do {
            $0.showsVerticalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: NewsTableViewCell.self)
        }
    }
    
    func bindViewModel() {
        let input = NewsViewModel.Input(load: Driver.just(()))
        let output = viewModel.transform(input, disposeBag: disposeBag)
        
        output.news
            .asDriver()
            .drive(onNext: { [unowned self] news in
                self.newsList = news
                print("AAB_\(newsList)")
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    @IBAction func filterTapped(_ sender: Any) {
        let filterVC = FilterSheetViewController()
        filterVC.modalPresentationStyle = .pageSheet
            
            if let sheet = filterVC.sheetPresentationController {
                // Customize the sheet
                sheet.detents = [.medium(), .large()] // Define detents: medium and large
                sheet.prefersGrabberVisible = true    // Show a grabber at the top of the sheet
                sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            }
            
            // Present the sheet
            self.present(filterVC, animated: true, completion: nil)
    }
}

// MARK: - Binders
extension NewsViewController {
    
}

// MARK: - StoryboardSceneBased
extension NewsViewController: StoryboardSceneBased {
    static var sceneStoryboard = Constants.Storyboards.news
}
