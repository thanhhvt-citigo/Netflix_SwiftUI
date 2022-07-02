//
//  ServiceContainer.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import Swinject

class ServiceContainer: DIContainer {
    static var container: Container {
        let container = Container()
        
        container.register(NetworkManager.self) { _ in
            NetworkManagerImpl()
        }
        .inObjectScope(.container)
        
        container.register(APIClient.self) { _ in
            APIClientImpl()
        }
        .inObjectScope(.container)
        
        container.register(AuthenticationUseCase.self) { _ in
            AuthenticationRepositoryImpl()
        }
        .inObjectScope(.container)
        
        container.register(UserDefaultsManager.self) { _ in
            UserDefaultsManagerImpl()
        }
        .inObjectScope(.container)
        
        return container
    }
}
