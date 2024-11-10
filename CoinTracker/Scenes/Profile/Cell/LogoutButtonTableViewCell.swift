//
//  LogoutButtonTableViewCell.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 21/10/2024.
//

import UIKit
import Reusable
import RxSwift

final class LogoutButtonTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet private weak var logoutButton: UIButton!
    
    var disposeBag = DisposeBag()
    var logout: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configView()
    }
    
    private func configView() {
        logoutButton.layer.cornerRadius = 16
        logoutButton.clipsToBounds = true
        logoutButton.rx.tap.subscribe(
            onNext: { [weak self] in
                self?.logout?()
            }
        ).disposed(by: disposeBag)
    }
}
