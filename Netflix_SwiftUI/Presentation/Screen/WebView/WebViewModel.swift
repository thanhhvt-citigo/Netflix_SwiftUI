//
//  File.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation

class WebViewModel: ViewModel {
    fileprivate let url: String
    
    init(url: String) {
        self.url = url
    }
}

extension Outputs where Base: WebViewModel {
    var url: String {
        return vm.url
    }
}
