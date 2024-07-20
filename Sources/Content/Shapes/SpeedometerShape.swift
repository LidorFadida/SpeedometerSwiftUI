//
//  SpeedometerShape.swift
//  SpeedometerSwiftUI
//
//  Created by Lidor Fadida on 20/07/2024.
//

import SwiftUI

struct SpeedometerShapeConfiguration {
    let angle: Double
    let length: CGFloat
}

struct SpeedometerShape: Shape {
    let configurations: [SpeedometerShapeConfiguration]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let centerX = rect.midX
        let centerY = rect.midY
        
        ///X^2 + Y^2 = R^2
        for config in configurations {
            let targetPosition = Calculator.position(in: rect, angle: config.angle)
            let dx = (centerX - targetPosition.x)
            let dy = (centerY - targetPosition.y)
            let distance = sqrt(dx * dx + dy * dy)
            
            let scale = config.length / distance
            let endPoint = CGPoint(x: targetPosition.x + dx * scale, y: targetPosition.y + dy * scale)
            
            path.move(to: targetPosition)
            path.addLine(to: endPoint)
        }
        
        return path
    }
}
