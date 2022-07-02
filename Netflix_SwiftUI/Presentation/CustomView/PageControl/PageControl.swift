//
//  PageControl.swift
//  Netflix_SwiftUI
//
//  Created by thanh tien on 03/07/2022.
//

import SwiftUI

struct PageControl: View {
    @Binding var currentIndex: Int

    var pages: Int
    var size: CGFloat
    var spacing: CGFloat
    var color: Color
    var selectedColor: Color

    private var radius: CGFloat { size / 2}

    private var currentPosition: CGFloat {
        // Get the first circle position
        let stackWidth = size * CGFloat(pages) + spacing * CGFloat(pages - 1)
        let halfStackWidth = stackWidth / 2
        let iniPosition = -halfStackWidth + radius

        // Calculate the distance to get the next circle
        let distanceToNextPoint = size + spacing

        // Use the pageIndex to get the current position
        return iniPosition + (CGFloat(currentIndex) * distanceToNextPoint)
    }

    var body: some View {
        ZStack {
            // Total number of pages
            HStack(spacing: spacing) {
                ForEach(0..<pages, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? selectedColor : color)
                        .frame(width: size, height: size)
                        .animation(.default)
                }
            }
        }
    }
}

struct PageControl_Previews: PreviewProvider {
    static var previews: some View {
        PageControl(currentIndex: .constant(2), pages: 4, size: 8, spacing: 30, color: .gray, selectedColor: .red)
    }
}
