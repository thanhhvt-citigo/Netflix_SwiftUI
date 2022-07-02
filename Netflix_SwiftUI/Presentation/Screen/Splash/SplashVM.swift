//
//  SplashVM.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import Combine
import AVFoundation

class SplashVM: ViewModel, ObservableObject {
    @Published
    var isPaused = false
    
    @Published
    var player: AVPlayer?
    
    @Published
    var username: String?
    
    @Published
    var password: String?
    
    private let authenticationRepository: AuthenticationUseCase = ServiceContainer.get()
    private var userDefaultsManager: UserDefaultsManager = ServiceContainer.get()
    
    let showOnboardingTrigger = PassthroughSubject<Void, Never>()
    
    override init() {
        super.init()
        username = userDefaultsManager.username
        password = userDefaultsManager.password
        setupAVPlayer()
        setupBindings()
    }
    
    private func setupAVPlayer() {
        guard let path = Bundle.main.path(forResource: "Netflix_N_video", ofType:"mp4") else {
            debugPrint("video not found")
            return
        }
        player = AVPlayer(url: URL(fileURLWithPath: path))
        
        let introVideoFinished = $isPaused.filter { $0 }.prefix(1)
        
        let accountDetail: AnyPublisher<AccountDetail?, Never> = lifeCycle
            .filter { $0 == .didLoad }
            .flatMap { [weak self] _ -> AnyPublisher<String?, Never> in
                guard let self = self else {
                    return Just(nil).eraseToAnyPublisher()
                }
                return self.createNewRequestToken()
            }
            .flatMap { [weak self] token -> AnyPublisher<String?, Never> in
                guard let self = self, let username = self.username, let password = self.password, let token = token else {
                    return Just(nil).eraseToAnyPublisher()
                }
                
                return self.verifyRequestToken(username: username, password: password, token: token)
            }
            .flatMap { [weak self] token -> AnyPublisher<String?, Never> in
                guard let self = self, let token = token else {
                    return Just(nil).eraseToAnyPublisher()
                }
                
                return self.createSession(token: token)
            }
            .flatMap { [weak self] sessionID -> AnyPublisher<AccountDetail?, Never> in
                guard let self = self, let sessionID = sessionID else {
                    return Just(nil).eraseToAnyPublisher()
                }
                
                return self.getAccountDetail(sessionID: sessionID)
            }
            .eraseToAnyPublisher()
        
        Publishers.Zip(accountDetail, introVideoFinished)
            .sink { [weak self] accountDetail, _ in
                self?.userDefaultsManager.accountDetail = accountDetail
                if let accountDetail = accountDetail {
                    print("main")
                    // go to main
                } else {
                    self?.showOnboardingTrigger.send()
                }
            }
            .store(in: &cancellables)
    }
    
    private func setupBindings() {
        $isPaused
            .sink { value in
                print("is paused = \(value)")
            }
            .store(in: &cancellables)
    }
    
    private func createNewRequestToken() -> AnyPublisher<String?, Never> {
        return authenticationRepository.createNewRequestToken()
            .map { response -> String? in
                switch response {
                case .error:
                    return nil
                case .value(let response):
                    return response.requestToken
                }
            }
            .eraseToAnyPublisher()
    }
    
    private func verifyRequestToken(username: String, password: String, token: String) -> AnyPublisher<String?, Never> {
        return authenticationRepository.verifyRequestToken(username: username, password: password, token: token)
            .map { result -> String? in
                switch result {
                case .error:
                    return nil
                case .value(let response):
                    return response.requestToken
                }
            }
            .eraseToAnyPublisher()
    }
    
    // return request token for create new session
    private func getAccountDetail(sessionID: String) -> AnyPublisher<AccountDetail?, Never> {
        return authenticationRepository.getAccountDetail(sessionID: sessionID)
            .map { result -> AccountDetail? in
                switch result {
                case .error:
                    return nil
                case .value(let accountDetail):
                    return accountDetail
                }
            }
            .eraseToAnyPublisher()
    }
    
    // return sessionID for get account detail
    private func createSession(token: String) ->  AnyPublisher<String?, Never> {
        return authenticationRepository.createSession(token: token)
            .map { result -> String? in
                switch result {
                case .error:
                    return nil
                case .value(let response):
                    return response.sessionID
                }
            }
            .eraseToAnyPublisher()
    }
}
