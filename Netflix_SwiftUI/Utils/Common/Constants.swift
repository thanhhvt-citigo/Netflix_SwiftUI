//
//  Constants.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation

struct Constants {
    static let APIKey = "85ab510c7fab5ad12a9ca0098ceab35e"
    static let USLanguageCode = "en-US"
    static let defaultLocaleIdentifier = "en_US_POSIX"
    
    static let passwordMinLength = 4
    static let passwordMaxlength = 16
    
    static let DEFAULT_TIMEOUT_INTERVAL: TimeInterval = 60.0
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case acceptLanguage = "Accept-Language"
    case ifModifiedSince = "If-Modified-Since"
    case userAgent = "User-Agent"
    case cookie = "Cookie"
    case deviceGuid = "X-DEVICE-GUID"
    case notificationId = "X-Push-Notify"
    case urlScheme = "X-Url-Scheme"
}

enum ContentType: String {
    case json = "application/json"
    case urlencoded = "application/x-www-form-urlencoded"
    case password = "X- -Password"
    case html = "text/html"
}

enum APIParamKeys {
    static let APIKey = "api_key"
    static let page = "page"
    static let language = "language"
    static let username = "username"
    static let password = "password"
    static let requestToken = "request_token"
    static let sortBy = "sort_by"
    static let withGenres = "with_genres"
    static let withOriginalLanguage = "with_original_language"
    static let includeVideo = "include_video"
    static let sessionID = "session_id"
    static let mediaType = "media_type"
    static let mediaID = "media_id"
    static let watchList = "watchlist"
}

enum ErrorMessage {
    static let notFound = "Not found"
    static let authenticalError = "Authentical error"
    static let badRequest = "Bad request"
    static let serverError = "Server error"
    static let errorOccur = "An error occurs"
}
