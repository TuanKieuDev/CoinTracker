//
//  Assembler.swift
//  CoinTracker
//
//  Created by Tuấn Kiều on 05/03/2024.
//

protocol Assembler: AnyObject,
                    GatewaysAssembler,
                    AppAssembler,
                    MainAssembler,
                    HomeAssembler {
    
}

final class DefaultAssembler: Assembler {
    
}
