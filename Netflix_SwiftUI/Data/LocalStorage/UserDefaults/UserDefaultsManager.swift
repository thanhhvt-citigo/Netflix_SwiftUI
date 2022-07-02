//
//  UserDefaultsManager.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation

enum UserDefaultsKey {
    static let username = "username"
    static let password = "password"
    static let accountDetail = "accountDetail"
}

protocol UserDefaultsManager {
    var username: String? { get set }
    var password: String? { get set }
    var accountDetail: AccountDetail? { get set }
}

class UserDefaultsManagerImpl: UserDefaultsManager {
    private let defaults = UserDefaults.standard
    
    var username: String? {
        get {
            return defaults.string(forKey: UserDefaultsKey.username)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKey.username)
        }
    }
    
    var password: String? {
        get {
            return defaults.string(forKey: UserDefaultsKey.password)
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKey.password)
        }
    }
    
    var accountDetail: AccountDetail? {
        get {
            guard let data = defaults.data(forKey: UserDefaultsKey.accountDetail) else {
                return nil
            }
            return try? JSONDecoder().decode(AccountDetail.self, from: data)
        }
        
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                return
            }
            defaults.set(data, forKey: UserDefaultsKey.accountDetail)
        }
    }
}
