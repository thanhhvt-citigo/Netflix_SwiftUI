//
//  DIContainer.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import Swinject

protocol DIContainer {
    static var container: Container { get }
    
    static func send<T>(_ value: T, withKey key: String)
    static func get<T>(key: String?) -> T
    static func get<T, P>(arg: P, key: String?) -> T
}

extension DIContainer {
    static func send<T>(_ value: T, withKey key: String) {
        self.container.register(T.self, name: key) { _ -> T in
            return value
        }
    }

    static func get<T>(key: String? = nil) -> T {
        guard let t = self.container.resolve(T.self, name: key) else {
            fatalError("Could not resolve dependency for key: \(key ?? "unknown")")
        }
        return t
    }

    static func get<T, P>(arg: P, key: String? = nil) -> T {
        guard let t = self.container.resolve(T.self, name: key, argument: arg) else {
            fatalError("Could not resolve dependency for key: \(key ?? "unknown")")
        }
        return t
    }
}
