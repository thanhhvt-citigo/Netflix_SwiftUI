//
//  SplashView.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import SwiftUI
import AVKit

struct SplashView: View {
    @ObservedObject var vm: SplashVM
    
    var body: some View {
        Group {
            if let player = vm.player {
                VideoPlayerView(isPaused: $vm.isPaused, player: player)
                    .frame(width: 300)
            } else {
                Image(Asset.Assets.netflixLogotypeNormal.name)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, alignment: .center)
            }
        }
        .background(Color.black)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(vm: .init())
    }
}
