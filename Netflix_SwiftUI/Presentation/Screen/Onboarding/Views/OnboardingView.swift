//
//  OnboardingView.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import SwiftUI

struct OnboardingView: View {
    let onboardingStep: OnboardingStep
    
    var body: some View {
        VStack(spacing: 10) {
            Image(Asset.Assets.onboarding1.name)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250, alignment: .center)
            
            Text(onboardingStep.title)
                .foregroundColor(.white)
                .font(.largeTitle.weight(.bold))
                .frame(width: 250, alignment: .center)
                .multilineTextAlignment(.center)
            
            Text(onboardingStep.message)
                .foregroundColor(.white)
                .font(UIFont.systemFont(ofSize: 17, weight: .medium).swiftUIFont)
                .frame(width: 250, alignment: .center)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(onboardingStep: .watchOnAnyDevice)
    }
}
