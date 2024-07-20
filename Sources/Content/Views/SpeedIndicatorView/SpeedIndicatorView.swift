//
//  SpeedIndicatorView.swift
//  SpeedometerSwiftUI
//
//  Created by Lidor Fadida on 20/07/2024.
//

import SwiftUI

struct SpeedIndicatorView: View {
    let labelValue: Int
    let rect: CGRect
    let angle: Double
    let radius: CGFloat
    let fontSize: CGFloat
    
    var body: some View {
        Text("\(labelValue)")
            .font(.system(size: fontSize))
            .offset(
                x: Calculator.position(
                    in: rect,
                    angle: angle).x - radius,
                
                y: Calculator.position(
                    in: rect,
                    angle: angle).y - radius
            )
    }
}
