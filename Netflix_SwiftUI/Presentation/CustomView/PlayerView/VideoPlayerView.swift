//
//  VideoPlayerView.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import SwiftUI
import AVFoundation

// The SwiftUI view which wraps the UIKit-based PlayerUIView above
struct VideoPlayerView: UIViewRepresentable {
    @Binding private(set) var isPaused: Bool
    let player: AVPlayer
    
    func makeUIView(context: Context) -> VideoPlayerUIView {
        let playerView = VideoPlayerUIView(player: player, isPaused: $isPaused)
        return playerView
    }
    
    func updateUIView(_ uiView: VideoPlayerUIView, context: Context) {
        // update uiview
        uiView.toggle(isPaused: isPaused)
    }
}
