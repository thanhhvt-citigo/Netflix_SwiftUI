//
//  TVEpisode.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation

struct TVEpisode: Codable {
    var airDate: String?
    var crew: Crew?
    var guestStar: Cast?
    var name: String?
    var overview: String?
    var id: Int?
    var productionCode: String?
    var seasonNumber: Int?
    var stillPath: String?
    var voteAverage: Double?
    var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case crew
        case guestStar = "guest_star"
        case name
        case overview
        case id
        case productionCode = "production_code"
        case seasonNumber = "season_number"
        case stillPath = "still_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
