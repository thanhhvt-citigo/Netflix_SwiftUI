//
//  Network.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation

struct Network: Codable {
    var headquarters: String?
    var homepage: String?
    var id: Int?
    var name: String?
    var originCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case headquarters
        case homepage
        case id
        case name
        case originCountry = "origin_country"
    }
}
