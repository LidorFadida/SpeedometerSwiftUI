//
//  ArcShape.swift
//  SpeedometerSwiftUI
//
//  Created by Lidor Fadida on 19/07/2024.
//

import SwiftUI

///A simple reusable arc
struct ArcShape: Shape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2.0
        return Path { path in
            path.addArc(
                center: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: clockwise
            )
        }
    }
}
