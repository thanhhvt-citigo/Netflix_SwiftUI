//
//  NavigationController.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation
import UIKit

class NavigationController: UINavigationController {
    override var prefersStatusBarHidden: Bool { false }
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    override var childForStatusBarStyle: UIViewController? { topViewController }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    fileprivate func setupNavigationBar() {
        navigationBar.isOpaque = false
        navigationBar.backgroundColor = .black
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.setTitleVerticalPositionAdjustment(0, for: .default)
        
        interactivePopGestureRecognizer?.isEnabled = true
        interactivePopGestureRecognizer?.delegate = self
    }
}

extension NavigationController: UIGestureRecognizerDelegate {}
