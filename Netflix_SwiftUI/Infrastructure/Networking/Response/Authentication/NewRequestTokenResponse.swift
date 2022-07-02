//
//  NewRequestTokenResponse.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation

struct NewRequestTokenResponse: Codable {
    var success: Bool?
    var expiresAt: String?
    var requestToken: String?
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
