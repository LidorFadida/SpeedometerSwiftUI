//
//  Gradient+Extensions.swift
//  SpeedometerSwiftUI
//
//  Created by Lidor Fadida on 19/07/2024.
//

import SwiftUI

extension Gradient {
    static let speedometerGradient = Gradient(stops: [
        Gradient.Stop(color: .crimsonRed, location: 0.0),
        Gradient.Stop(color: .crimsonRed, location: 0.25),
        Gradient.Stop(color: .forestGreen, location: 0.50),
        Gradient.Stop(color: .goldenYellow, location: 0.75),
        Gradient.Stop(color: .crimsonRed, location: 1.0)
    ])
}
