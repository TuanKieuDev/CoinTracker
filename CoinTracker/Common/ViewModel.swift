//
//  ViewModel.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

import RxSwift

public protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input, disposeBag: DisposeBag) -> Output
}
