//
//  GaugeView.swift
//  SpeedometerSwiftUI
//
//  Created by Lidor Fadida on 18/07/2024.
//

import SwiftUI

public struct GaugeView: View {
    public var animationDuration: TimeInterval
    public var progress: CGFloat
    public var numberOfSegments: Int
    public var step: Int
    public var fontSize: CGFloat
    
    @State private var meterAngle: Double
    @State private var indicatorsConfigurations: [IndicatorViewConfiguration] = []
    
    public init(animationDuration: TimeInterval, progress: CGFloat = 0.0, numberOfSegments: Int = 100, step: Int = 10, fontSize: CGFloat = 16) {
        self.animationDuration = animationDuration
        self.progress = progress
        self.numberOfSegments = numberOfSegments
        self.step = step
        self.fontSize = fontSize
        self.meterAngle = Constants.startAngle
    }
    
    private struct Constants {
        static let startAngle: Double = 135.0
        static let endAngle: Double = 45.0
    }
    
    public var body: some View {
        SpeedometerView(
            startAngle: Constants.startAngle,
            endAngle: Constants.endAngle,
            meterAngle: meterAngle,
            progress: progress,
            numberOfSegments: numberOfSegments,
            step: step,
            fontSize: fontSize,
            indicatorsConfigurations: indicatorsConfigurations
        )
        .task {
            indicatorsConfigurations = await Calculator.indicatorsConfigurations(
                startAngle: Constants.startAngle,
                endAngle: Constants.endAngle,
                numberOfSegments: numberOfSegments
            )
        }
        .onChange(of: progress) { _ in
            animateMeter()
        }
    }
    
    //TODO: - Fix: When the meter is decelerating the animation looks and feels like there is a tiny delay.
    private func animateMeter() {
        let meterAngle = Calculator.angle(progress: progress, startAngle: Constants.startAngle, endAngle: Constants.endAngle)
        withAnimation(.bouncy(duration: animationDuration * 3.0)) {
            self.meterAngle = meterAngle
        }
    }
}
