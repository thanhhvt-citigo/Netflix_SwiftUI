//
//  UIWindow+Extensions.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation
import UIKit

extension UIWindow {
    func switchRootViewController(to viewController: UIViewController, animated: Bool = true, duration: TimeInterval = 0.5, options: UIView.AnimationOptions = .transitionCrossDissolve, _ completion: (() -> Void)? = nil) {
        
        guard animated else {
            rootViewController = viewController
            completion?()
            return
        }
        
        UIView.transition(with: self, duration: duration, options: options, animations: {
            let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            self.rootViewController = viewController
            UIView.setAnimationsEnabled(oldState)
        }, completion: { _ in
            completion?()
        })
    }
}
