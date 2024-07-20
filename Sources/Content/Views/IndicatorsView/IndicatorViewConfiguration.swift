//
//  IndicatorViewConfiguration.swift
//  SpeedometerSwiftUI
//
//  Created by Lidor Fadida on 19/07/2024.
//

import Foundation

struct IndicatorViewConfiguration: Identifiable {
    let id: String = UUID().uuidString
    let index: Int
    let angle: Double
}
