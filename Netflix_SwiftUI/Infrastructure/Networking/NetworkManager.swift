//
//  NetworkManager.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import Moya
import Alamofire

protocol NetworkManager {
    func getAPIProvider<T: TargetType>(type: T.Type) -> MoyaProvider<T>
}

class NetworkManagerImpl: NetworkManager {
    func getAPIProvider<T: TargetType>(type: T.Type) -> MoyaProvider<T> {
        let plugins: [PluginType] = [
            NetworkLoggerPlugin(configuration: .init(
                formatter: .init(responseData: jsonResponseDataFormatter),
                logOptions: .verbose)
                               ),
            CachePolicyPlugin()
        ]
        return MoyaProvider<T>(session: APISession.session, plugins: plugins)
    }
}

private func jsonResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

class CachePolicyPlugin: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var mutableRequest = request
        mutableRequest.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return mutableRequest
    }
}
