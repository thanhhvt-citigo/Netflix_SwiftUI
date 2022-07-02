//
//  SessionResponse.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation

struct SessionResponse: Codable {
    var success: Bool?
    var sessionID: String?
    
    enum CodingKeys: String, CodingKey {
        case success
        case sessionID = "session_id"
    }
}
