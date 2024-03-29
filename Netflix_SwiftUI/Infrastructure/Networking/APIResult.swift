//
//  APIResult.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation

enum APIResult<T> {
    case value(T)
    case error(Error)
}
