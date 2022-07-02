//
//  APIError.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation

struct APIError: Error, Codable {
    var success: Bool?
    var status_code: Int?
    var status_message: String?
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        return NSLocalizedString(status_message ?? ErrorMessage.errorOccur, comment: "")
    }
}
