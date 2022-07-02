//
//  APIClient.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import Combine
import Moya

protocol APIClient {
    func request<T: Decodable, P: TargetType>(router: P, type: T.Type) -> AnyPublisher<APIResult<T>, Never>
}

class APIClientImpl: APIClient {
    private let networkManager: NetworkManager = ServiceContainer.get()
    
    func request<T: Decodable, P: TargetType>(router: P, type: T.Type) -> AnyPublisher<APIResult<T>, Never> {
        let provider = networkManager.getAPIProvider(type: P.self)
        
        return Deferred {
            Future { promise in
                provider.request(router) { result in
                    switch result {
                    case .failure(let error):
                        if let data = error.response?.data {
                            do {
                                let response = try JSONDecoder().decode(APIError.self, from: data)
                                promise(.success(.error(response)))
                            } catch let error {
                                print(error)
                                promise(.success(.error(APIError(status_code: nil, status_message: ErrorMessage.errorOccur))))
                            }
                        }
                        let statusCode = error.response?.statusCode
                        switch statusCode {
                        case HTTPStatusCodes.internalServerError.rawValue,
                            HTTPStatusCodes.notImplemented.rawValue,
                            HTTPStatusCodes.badGateway.rawValue,
                            HTTPStatusCodes.serviceUnavailable.rawValue,
                            HTTPStatusCodes.gatewayTimeout.rawValue:
                            promise(.success(.error(APIError(status_code: statusCode, status_message: ErrorMessage.serverError))))
                        case HTTPStatusCodes.notFound.rawValue:
                            promise(.success(.error(APIError(status_code: statusCode, status_message: ErrorMessage.notFound))))
                        case HTTPStatusCodes.badRequest.rawValue:
                            promise(.success(.error(APIError(status_code: statusCode, status_message: ErrorMessage.badRequest))))
                        default:
                            promise(.success(.error(APIError(status_code: statusCode, status_message: ErrorMessage.errorOccur))))
                        }
                    case .success(let response):
                        let statusCode = response.statusCode
                        if statusCode == HTTPStatusCodes.oK.rawValue || statusCode == HTTPStatusCodes.created.rawValue {
                            let data = response.data
                            do {
                                let object = try JSONDecoder().decode(T.self, from: data)
                                promise(.success(.value(object)))
                            } catch let error {
                                print(error)
                                promise(.success(.error(error)))
                            }
                        } else {
                            let data = response.data
                            do {
                                let error = try JSONDecoder().decode(APIError.self, from: data)
                                promise(.success(.error(error)))
                            } catch let error {
                                print(error)
                                promise(.success(.error(error)))
                            }
                        }
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
