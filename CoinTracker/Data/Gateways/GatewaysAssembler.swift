//
//  GatewaysAssembler.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 06/03/2024.
//

import UIKit

protocol GatewaysAssembler {
    func resolve() -> AppGatewayType
//    func resolve() -> RepoGatewayType
//    func resolve() -> ProductGatewayType
}

extension GatewaysAssembler where Self: DefaultAssembler {

    func resolve() -> AppGatewayType {
        return AppGateway()
    }
//
//    func resolve() -> RepoGatewayType {
//        return RepoGateway()
//    }
//
//    func resolve() -> ProductGatewayType {
//        return ProductGateway()
//    }
}
