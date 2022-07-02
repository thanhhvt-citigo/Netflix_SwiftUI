//
//  VideoPlayerUIView.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 02/07/2022.
//

import Foundation
import SwiftUI
import AVFoundation

// The UIView that contains the AVPlayerLayer for rendering the video
class VideoPlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    private var timeObservation: Any?
    private var isPaused: Binding<Bool>
    private var duration: Double?
    private var durationObservation: NSKeyValueObservation?

    var player: AVPlayer? {
        didSet {
            playerLayer.player = player
        }
    }
    
    init(player: AVPlayer?, isPaused: Binding<Bool>) {
        self.player = player
        self.isPaused = isPaused
        super.init(frame: .zero)
        commonInit()
    }
    
    override init(frame: CGRect) {
        isPaused = .constant(false)
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        playerLayer.player = player
        layer.addSublayer(playerLayer)
        
        durationObservation = player?.currentItem?.observe(\.duration, changeHandler: { [weak self] item, change in
            guard let self = self else { return }
            self.duration = item.duration.seconds
        })
        
        timeObservation = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.5, preferredTimescale: 600), queue: nil) { [weak self] time in
            guard let self = self, let duration = self.duration, duration > 0 else { return }
            let progress = time.seconds / duration
            if progress >= 1 {
                self.isPaused.wrappedValue = true
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    func toggle(isPaused: Bool) {
        if isPaused {
            player?.pause()
        } else {
            player?.play()
        }
    }
}
