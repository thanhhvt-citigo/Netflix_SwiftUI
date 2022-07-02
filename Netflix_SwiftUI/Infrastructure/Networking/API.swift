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
    case verifyRequestToken(username: String, password: String, token: String)
    case createSession(token: String)
    case getAccountDetail(sessionID: String)
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: Router.baseURL)!
    }
    
    var method: Moya.Method {
        switch self {
        case .verifyRequestToken, .createSession:
            return .post
        default:
            return .get
        }
    }
    
    var task: Task {
        var parameters: [String: Any] = [APIParamKeys.APIKey: Constants.APIKey]
        var encoding: ParameterEncoding = URLEncoding.default
        var urlParameter: [String: Any] = [:]

        switch self {
        case .verifyRequestToken(let username, let password, let token):
            encoding = JSONEncoding.default
            urlParameter = [APIParamKeys.APIKey: Constants.APIKey]
            parameters = [APIParamKeys.username: username, APIParamKeys.password: password, APIParamKeys.requestToken: token]
            return .requestCompositeParameters(bodyParameters: parameters, bodyEncoding: encoding, urlParameters: urlParameter)
        case .createSession(let token):
            encoding = JSONEncoding.default
            parameters = [APIParamKeys.requestToken: token]
            urlParameter = [APIParamKeys.APIKey: Constants.APIKey]
            return .requestCompositeParameters(bodyParameters: parameters, bodyEncoding: encoding, urlParameters: urlParameter)
        case .getAccountDetail(let sessionID):
            encoding = URLEncoding.default
            parameters = [APIParamKeys.APIKey: Constants.APIKey,
                          APIParamKeys.sessionID: sessionID]
            return .requestParameters(parameters: parameters, encoding: encoding)
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
        case .verifyRequestToken:
            return Router.version3 + Router.authentication + Router.token + Router.validateWithLogin
        case .createSession:
            return Router.version3 + Router.authentication + Router.session + Router.new
        case .getAccountDetail:
            return Router.version3 + Router.account
        }
    }
}
