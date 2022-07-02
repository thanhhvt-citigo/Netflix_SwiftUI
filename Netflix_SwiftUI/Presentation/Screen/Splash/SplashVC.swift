//
//  SplashVC.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import UIKit
import Combine

class SplashVC: Controller<SplashVM> {
    private var contentView: SplashView!
    private var hostingController: FixedHostingController<SplashView>!
    
    override func setup() {
        super.setup()
        view.backgroundColor = .black
        setupHostingController()
        setupBindings()
    }
    
    private func setupBindings() {
        
    }
    
    private func setupHostingController() {
        contentView = .init(vm: vm)
        hostingController = .init(rootView: contentView, ignoreSafeArea: true)
        hostingController.view.backgroundColor = .clear
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        hostingController.didMove(toParent: self)
    }
}
