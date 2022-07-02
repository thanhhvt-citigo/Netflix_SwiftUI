//
//  HTTPStatusCodes.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation

enum HTTPStatusCodes: Int {
    // 100 Informational
    case continuing = 100
    case switchingProtocols
    case processing
    // 200 Success
    case oK = 200
    case created = 201
    case accepted
    case nonAuthoritativeInformation
    case noContent
    case resetContent
    case partialContent
    case multiStatus
    case alreadyReported
    case imUsed = 226
    // 300 Redirection
    case multipleChoices = 300
    case movedPermanently
    case found
    case seeOther
    case notModified
    case useProxy
    case switchProxy
    case temporaryRedirect
    case permanentRedirect
    // 400 Client Error
    case badRequest = 400
    case unauthorized = 401
    case passwordRequired = 402
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed
    case notAcceptable = 406
    case proxyAuthenticationRequired
    case requestTimeout
    case conflict
    case gone
    case lengthRequired
    case preconditionFailed
    case payloadTooLarge
    case uriTooLong
    case unsupportedMediaType
    case rangeNotSatisfiable
    case expectationFailed
    case imATeapot = 420
    case misdirectedRequest = 421
    case unprocessableEntity
    case locked = 423
    case failedDependency
    case upgradeRequired = 426
    case preconditionRequired = 428
    case tooManyRequests
    case requestHeaderFieldsTooLarge = 431
    case unavailableForLegalReasons = 451
    // 500 Server Error
    case internalServerError = 500
    case notImplemented = 501
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case httpVersionNotSupported = 505
    case variantAlsoNegotiates = 506
    case insufficientStorage = 507
    case loopDetected = 508
    case notExtended = 510
    case networkAuthenticationRequired = 511
}
