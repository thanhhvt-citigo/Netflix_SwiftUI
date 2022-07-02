//
//  OnboardingContainerView.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import SwiftUI

struct OnboardingContainerView: View {
    @ObservedObject var vm: OnboardingVM
    
    var body: some View {
        VStack {
            GeometryReader { proxy in
                ZStack(alignment: .bottom) {
                    PagerView(pageCount: OnboardingStep.allCases.count, currentIndex: $vm.currentIndex) {
                        ForEach(OnboardingStep.allCases.indices, id: \.self) { index in
                            OnboardingView(onboardingStep: OnboardingStep.allCases[index])
                                .position(x: proxy.size.width / 2, y: proxy.size.height / 2 - 100)
                                .background(Color.black)
                        }
                    }
                    
                    PageControl(currentIndex: $vm.currentIndex, pages: OnboardingStep.allCases.count, size: 8, spacing: 10, color: .gray, selectedColor: .red)
                        .offset(y: -10)
                }
            }
            
            Button {
                vm.signinButtonTapped.send()
            } label: {
                Text(L10n.signInButton)
                    .font(.body.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(Rectangle())
                    .background(
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color.red)
                    )
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .frame(height: 48)
        }
    }
}

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContainerView(vm: .init())
    }
}
