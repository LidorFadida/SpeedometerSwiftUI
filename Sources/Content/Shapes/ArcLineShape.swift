//
//  ArcLineShape.swift
//  SpeedometerSwiftUI
//
//  Created by Lidor Fadida on 19/07/2024.
//

import SwiftUI

///Draws a line from rect.midX , rect.midY to angle calculated position .
struct ArcLineShape: Shape {
    var animatableData: Double
    
    func path(in rect: CGRect) -> Path {
        let targetPosition = Calculator.position(in: rect, angle: animatableData)
        return Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addLine(to: targetPosition)
        }
    }
}

