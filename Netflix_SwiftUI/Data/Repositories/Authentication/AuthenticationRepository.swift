//
//  AuthenticationRepository.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation
import Combine

class AuthenticationRepositoryImpl: AuthenticationUseCase {
    private let apiClient: APIClient = ServiceContainer.get()
    
    func createNewRequestToken() -> AnyPublisher<APIResult<NewRequestTokenResponse>, Never> {
        return apiClient.request(router: API.createRequestToken, type: NewRequestTokenResponse.self)
    }
    
    func verifyRequestToken(username: String, password: String, token: String) -> AnyPublisher<APIResult<NewRequestTokenResponse>, Never> {
        return apiClient.request(router: API.verifyRequestToken(username: username, password: password, token: token), type: NewRequestTokenResponse.self)
    }
    
    func createSession(token: String) -> AnyPublisher<APIResult<SessionResponse>, Never> {
        return apiClient.request(router: API.createSession(token: token), type: SessionResponse.self)
    }
    
    func getAccountDetail(sessionID: String) -> AnyPublisher<APIResult<AccountDetail>, Never> {
        return apiClient.request(router: API.getAccountDetail(sessionID: sessionID), type: AccountDetail.self)
    }
}
