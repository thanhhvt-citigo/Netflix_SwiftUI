//
//  UIApplication+Extensions.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation
import UIKit

extension UIApplication {
    var currentWindow: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }

    var currentTabbarController: UITabBarController? {
        return currentWindow?.rootViewController as? UITabBarController
    }

    func endEditing() {
        currentWindow?.endEditing(true)
    }
    
    var isSplitOrSlideOver: Bool {
        guard let w = self.delegate?.window, let window = w else { return false }
        return !window.frame.equalTo(window.screen.bounds)
    }
}
