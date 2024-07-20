//
//  SpeedometerView.swift
//  SpeedometerSwiftUI
//
//  Created by Lidor Fadida on 19/07/2024.
//

import SwiftUI

struct SpeedometerView: View {
    let startAngle: Double
    let endAngle: Double
    let meterAngle: Double
    let progress: CGFloat
    let numberOfSegments: Int
    let step: Int
    let fontSize: CGFloat
    let indicatorsConfigurations: [IndicatorViewConfiguration]
    
    private struct Constants {
        static let arcsInset: CGFloat = 20.0
        static let meterStrokeStyle = StrokeStyle(lineWidth: 4.0, lineCap: .round)
        static let meterTrimStart: CGFloat = 0.3
        static let meterTrimEnd: CGFloat = 0.6
        static let progressArcLineWidth: CGFloat = 10.0
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .center) {
                ArcShape(
                    startAngle: .degrees(startAngle),
                    endAngle: .degrees(endAngle),
                    clockwise: false
                )
                .stroke(Color.gray, lineWidth: 1.0)
                .frame(width: proxy.size.width, height: proxy.size.height)
                
                ArcLineShape(animatableData: meterAngle)
                    .trim(from: Constants.meterTrimStart, to: Constants.meterTrimEnd) //TODO: - Should be calculated dynamically.
                    .stroke(Color.strongRed, style: Constants.meterStrokeStyle)
                    .frame(width: proxy.size.width - Constants.arcsInset, height: proxy.size.height - Constants.arcsInset)
                ZStack(alignment: .center) {
                    ArcShape(
                        startAngle: .degrees(startAngle),
                        endAngle: .degrees(endAngle),
                        clockwise: false
                    )
                    .stroke(Color.gray.opacity(0.4), lineWidth: Constants.progressArcLineWidth)
                    
                    ArcShape(
                        startAngle: .degrees(startAngle),
                        endAngle: .degrees(endAngle),
                        clockwise: false
                    )
                    .trim(from: .zero, to: progress)
                    .stroke(AngularGradient.speedometerAngularGradient, lineWidth: Constants.progressArcLineWidth)
                }
                .frame(width: proxy.size.width + Constants.arcsInset, height: proxy.size.height + Constants.arcsInset)
                
                IndicatorsView(
                    indicatorConfigurations: indicatorsConfigurations,
                    step: step,
                    fontSize: fontSize
                )
                .frame(width: proxy.size.width, height: proxy.size.height)
                
                SpeedDisplayView(
                    progress: progress,
                    numberOfSegments: numberOfSegments
                )
            }
        }
    }
}
