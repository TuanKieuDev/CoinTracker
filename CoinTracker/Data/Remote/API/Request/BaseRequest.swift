//
//  BaseRequest.swift
//  CoinTracker
//
//  Created by Kieu Anh Tuan on 29/10/2024.
//

import Foundation
import Alamofire

class BaseRequest: NSObject {

    var url = ""
    var requestType = Alamofire.HTTPMethod.get
    var parameter: [String: Any]?
    var headers: HTTPHeaders?

    init(url: String) {
        super.init()
        self.url = url
    }

    init(url: String, requestType: Alamofire.HTTPMethod) {
        super.init()
        self.url = url
        self.requestType = requestType
    }

    init(url: String, 
         requestType: Alamofire.HTTPMethod,
         parameter: [String: Any]?
    ) {
        super.init()
        self.url = url
        self.requestType = requestType
        self.parameter = parameter
    }
    
    init(url: String,
         requestType: Alamofire.HTTPMethod,
         parameter: [String: Any]?,
         headers: HTTPHeaders
    ) {
        super.init()
        self.url = url
        self.requestType = requestType
        self.parameter = parameter
        self.headers = headers
    }

    var encoding: ParameterEncoding {
        switch requestType {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
}
