//
//  OnboardingVM.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation
import Combine

enum OnboardingStep: CaseIterable {
    case watchOnAnyDevice
    case download
    case noPeskyContract
    
    var imageName: String {
        switch self {
        case .watchOnAnyDevice:
            return Asset.Assets.onboarding1.name
        case .download:
            return Asset.Assets.onboarding2.name
        case .noPeskyContract:
            return Asset.Assets.onboarding3.name
        }
    }
    
    var title: String {
        switch self {
        case .watchOnAnyDevice:
            return L10n.onboardingWatchOnAnyDeviceTitle
        case .download:
            return L10n.onboardingDownloadTitle
        case .noPeskyContract:
            return L10n.onboardingNoPeskyContractsTitle
        }
    }
    
    var message: String {
        switch self {
        case .watchOnAnyDevice:
            return L10n.onboardingWatchOnAnyDeviceMessage
        case .download:
            return L10n.onboardingDownloadMessage
        case .noPeskyContract:
            return L10n.onboardingNoPeskyContractsMessage
        }
    }
}

class OnboardingVM: ViewModel, ObservableObject {
    @Published
    var currentIndex = 0
    
    let signinButtonTapped = PassthroughSubject<Void, Never>()
}
