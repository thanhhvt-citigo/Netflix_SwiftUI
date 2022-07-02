//
//  WKWebView+Extensions.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation
import WebKit

extension WKWebView {
    class func clean() {
        URLCache.shared.removeAllCachedResponses()
        WKWebsiteDataStore.default().removeData(ofTypes: [WKWebsiteDataTypeMemoryCache, WKWebsiteDataTypeDiskCache], modifiedSince: Date(timeIntervalSince1970: 0), completionHandler: {})
    }
}
