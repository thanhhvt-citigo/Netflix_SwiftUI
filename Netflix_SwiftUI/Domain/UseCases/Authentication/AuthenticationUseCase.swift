//
//  AuthenticationUseCase.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation
import Combine

protocol AuthenticationUseCase {
    func createNewRequestToken() -> AnyPublisher<APIResult<NewRequestTokenResponse>, Never>
    func verifyRequestToken(username: String, password: String, token: String) -> AnyPublisher<APIResult<NewRequestTokenResponse>, Never>
    func createSession(token: String) -> AnyPublisher<APIResult<SessionResponse>, Never>
    func getAccountDetail(sessionID: String) -> AnyPublisher<APIResult<AccountDetail>, Never>
}
