//
//  Controller.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import UIKit
import Combine
import SnapKit

class Controller<VM: ViewModel>: UIViewController {
    private let viewModel: VM!

    var vm: VM {
        return viewModel
    }

    var cancellables = Set<AnyCancellable>()
    
    private let defaultBackButton = UIButton(type: .custom)
    let lifeCycle = PassthroughSubject<VM.LifeCycle, Never>()
    
    private lazy var defaultBackBarButton: UIBarButtonItem = {
        let containerView = UIView()
        containerView.snp.makeConstraints { make in
            make.width.height.equalTo(36)
        }
        
        let backImage = UIImageView(image: Asset.Assets.chevronLeftNormal.image)
        backImage.contentMode = .scaleAspectFit
        containerView.addSubview(backImage)
        backImage.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
            make.width.height.equalTo(16)
        }
        
        containerView.addSubview(defaultBackButton)
        defaultBackButton.backgroundColor = .clear
        defaultBackButton.setTitle(nil, for: .normal)
        defaultBackButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        let customBackButton = UIBarButtonItem(customView: containerView)
        return customBackButton
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }

    required init(vm: VM, nibName nibNameOrNil: String? = nil, bundle nibBundleOrNil: Bundle? = nil) {
        viewModel = vm
        let resourceName = nibNameOrNil ?? String(describing: Self.self)
        if Bundle.main.path(forResource: resourceName, ofType: "xib") == nil {
            super.init(nibName: nil, bundle: nil)
        } else {
            super.init(nibName: resourceName, bundle: nibBundleOrNil)
        }
        hidesBottomBarWhenPushed = true
    }

    required init?(coder: NSCoder) {
        self.viewModel = nil
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDefaultBackButton()
        setup()
        lifeCycle.send(.didLoad)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lifeCycle.send(.willAppear)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lifeCycle.send(.didAppear)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        lifeCycle.send(.willDisappear)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        lifeCycle.send(.didDisappear)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lifeCycle.send(.didLayoutSubviews)
    }
    
    private func setupDefaultBackButton() {
        if self != navigationController?.viewControllers.first {
            navigationItem.leftBarButtonItem = defaultBackBarButton
            defaultBackButton.addTarget(self, action: #selector(UINavigationController.popViewController(animated:)), for: .touchUpInside)
        }
    }
    
    func setup() {
        lifeCycle
            .sink(receiveValue: { [weak self] state in
                self?.vm.lifeCycle.send(state)
            })
            .store(in: &cancellables)
    }

    deinit {
        print("\(String(describing: self)) deinit")
    }
}
