//
//  TVSeason.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation

struct TVSeason: Codable {
    var id: Int?
    var airDate: String?
    var episodes: [TVEpisode]?
    var name: String?
    var overview: String?
    var _id: String?
    var posterPath: String?
    var seasonNumber: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case _id
        case airDate = "air_date"
        case episodes
        case name
        case overview
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
    }
}
