//
//  RequestRouter.swift
//  pomac
//
//  Created by ziad on 11/03/2022.
//

import UIKit
import Alamofire
enum RequestRouter: URLRequestBuilder{
    var parameters: Parameters?{
        let params = Parameters.init()
        switch self {
        case .home:
            print("")
        }
        return params
    }
    
    
    case home
    
    
    internal var path: String {
        switch self {
        case .home:
            return ServerPaths.home.rawValue
        }
    }
    
    
    var method: HTTPMethod{
        switch self {
        case .home:
            return .get
        }
    }
    
    
}
