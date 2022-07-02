//
//  OnboardingVC.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import UIKit
import Combine

class OnboardingVC: Controller<OnboardingVM> {
    private var contentView: OnboardingContainerView!
    private var hostingController: FixedHostingController<OnboardingContainerView>!
    
    override func setup() {
        super.setup()
        setupNavigationBar()
        setupHostingController()
        setupBindings()
    }
    
    private func setupNavigationBar() {
        let helpButtonItem = UIBarButtonItem(title: L10n.onboardingNavigationHelp, style: .done, target: self, action: #selector(showHelpScreen))
        let privacyButtonItem = UIBarButtonItem(title: L10n.onboardingNavigationPrivacy, style: .done, target: self, action: #selector(showPrivacyScreen))
        navigationItem.rightBarButtonItems = [privacyButtonItem, helpButtonItem]
        navigationController?.navigationBar.tintColor = .white
        helpButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)], for: .normal)
        privacyButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)], for: .normal)
        helpButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)], for: .selected)
        privacyButtonItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)], for: .selected)
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        let leftLogoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 40))
        leftLogoImageView.center = CGPoint(x: leftLogoImageView.frame.size.width/2, y: leftView.frame.size.height/2)
        leftLogoImageView.image = Asset.Assets.netflixLogotypeNormal.image
        leftLogoImageView.contentMode = .scaleAspectFit
        leftView.addSubview(leftLogoImageView)

        let leftBarButtonItem = UIBarButtonItem(customView: leftView)
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc private func showHelpScreen() {
        let webVC = WebVC(vm: .init(url: Router.helpURL))
        present(NavigationController(rootViewController: webVC), animated: true)
    }
    
    @objc private func showPrivacyScreen() {
        let webVC = WebVC(vm: .init(url: Router.privacyURL))
        present(NavigationController(rootViewController: webVC), animated: true)
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
