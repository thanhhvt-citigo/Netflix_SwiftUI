//
//  SwiftUI+Extensions.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import Foundation
import SwiftUI

extension UIColor {
    var swiftUIColor: Color {
        Color(self)
    }
}

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

extension UIFont {
    var swiftUIFont: Font? {
        Font(self as CTFont)
    }
}
