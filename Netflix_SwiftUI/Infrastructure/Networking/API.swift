//
//  API.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import Moya

enum API {
    // authentication
    case createRequestToken
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: Router.baseURL)!
    }
    
    var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }
    
    var task: Task {
        var parameters: [String: Any] = [APIParamKeys.APIKey: Constants.APIKey]
        var encoding: ParameterEncoding = URLEncoding.default
        var urlParameter: [String: Any] = [:]

        switch self {
        default:
            return .requestParameters(parameters: parameters, encoding: encoding)
        }
    }
    
    var headers: [String : String]? {
        return [
            HTTPHeaderField.contentType.rawValue: ContentType.json.rawValue,
        ]
    }
    
    var path: String {
        switch self {
        case .createRequestToken:
            return Router.version3 + Router.authentication + Router.token + Router.new
        }
    }
}
