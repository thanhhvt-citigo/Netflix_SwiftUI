//
//  AccountDetail.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation

struct AccountDetail: Codable {
    var avatar: Avatar?
    var id: Int?
    var iso_639_1: String?
    var iso_3166_1: String?
    var name: String?
    var includeAdult: Bool?
    var username: String?
    
    enum CodingKeys: String, CodingKey {
        case avatar
        case id
        case iso_639_1
        case iso_3166_1
        case name
        case includeAdult = "include_adult"
        case username
    }
}

struct Avatar: Codable {
    var gravatar: Gravatar?
}

struct Gravatar: Codable {
    var hash: String?
}
