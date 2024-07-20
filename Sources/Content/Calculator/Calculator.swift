//
//  Calculator.swift
//  SpeedometerSwiftUI
//
//  Created by Lidor Fadida on 19/07/2024.
//

import Foundation

struct Calculator {
    
    private init() {}
    
    static func position(in rect: CGRect, angle: Double) -> CGPoint {
        let radius = rect.width / 2.0
        let angleInRadians = angle * .pi / 180.0
        
        let x = rect.midX + cos(angleInRadians) * radius
        let y = rect.midY + sin(angleInRadians) * radius
        return CGPoint(x: x, y: y)
    }
    
    static func angle(progress: CGFloat, startAngle: Double, endAngle: Double) -> Double {
        let normalizedEndAngle = (endAngle >= startAngle) ? endAngle : endAngle + 360.0
        let totalAngleRange = (normalizedEndAngle - startAngle)
        let currentAngle = startAngle + (totalAngleRange * progress)
        let adjustedAngle = currentAngle.truncatingRemainder(dividingBy: 360.0)
        let angle = if (adjustedAngle < startAngle) {
            adjustedAngle + 360.0
        } else {
            adjustedAngle
        }
        return angle
    }
    
    static func indicatorsConfigurations(startAngle: Double, endAngle: Double, numberOfSegments: Int) async -> [IndicatorViewConfiguration] {
        let angles = await angles(startAngle: startAngle, endAngle: endAngle, numberOfSegments: numberOfSegments)
        let configurations = zip(0..., angles).compactMap { index, angle in
            let angle = angles[index].truncatingRemainder(dividingBy: 360.0)
            return IndicatorViewConfiguration(
                index: index,
                angle: angle
            )
        }
        return configurations
    }
    
    private static func angles(startAngle: Double, endAngle: Double, numberOfSegments: Int) async -> [Double] {
        var angles: [Double] = []
        
        let totalAngle: Double = if startAngle > endAngle {
            (360.0 - startAngle) + endAngle
        } else {
            endAngle - startAngle
        }
        
        let step = totalAngle / Double(numberOfSegments)
        
        for i in 0...numberOfSegments {
            let angle = startAngle + (step * Double(i))
            angles.append(angle)
        }
        
        return angles
    }
}
