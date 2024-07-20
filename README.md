# SpeedometerSwiftUI

`SpeedometerSwiftUI` is a SwiftUI library that provides customizable speedometer gauges for your iOS applications. It includes a variety of components and configurations to create an animated speedometer with indicator lines and labels. This project is part of my exercise with SwiftUI drawings and is not intended to be a production-ready component. It's also worth mentioning that it is not fully flexible.


https://github.com/user-attachments/assets/b85d037f-5e62-40fe-a339-e8e248d00078


## Features

- **Customizable speedometer gauge**: Easily adjust the number of segments, steps, and animation duration.
- **Animated needle**: Smoothly animates the needle as the speed changes.
- **Indicator lines**: Displays indicator lines and labels for each segment.
- **Reusable shapes**: Modular design with reusable shapes for drawing arcs and lines.

## Customizing the Gauge

You can customize the `GaugeView` with parameters such as animation duration, progress, number of segments, step interval for major indicator lines, and font size for the indicator labels.

## Indicator Configuration

The library provides a convenient way to configure indicator lines and labels using the `Calculator` struct. The `Calculator.indicatorsConfigurations` function generates configurations based on the specified start and end angles and the number of segments.

## Drawing Shapes

The library includes several reusable shapes for drawing arcs and lines:

- `ArcShape`: Draws an arc from a start angle to an end angle.
- `ArcLineShape`: Draws a line from the center of a rectangle to a calculated position based on an angle.
- `SpeedometerShape`: Draws the indicator lines based on the provided configurations.


## Usage Example

Below is an example of how to integrate and customize the `GaugeView` within your SwiftUI application. 
Remember, the `GaugeView` receives a `progress` parameter that can represent download progress, heart rate, or any other progress-oriented metric you can think of.

```swift
import SwiftUI
import SpeedometerSwiftUI

struct Example: View {
    @State private var isPressing: Bool = false
    @State private var speed: TimeInterval = 0.01
    @State var progress: CGFloat = 0.0
    @State var numberOfSegments: Int = 10
    @State var step: Int = 5
  
    
    var body: some View {
        VStack {
            speedometer
            Button(action: {}, label: {
                Image(systemName: "pedal.accelerator")
                    .resizable()
                    .symbolVariant(.fill)
                    .foregroundStyle(.white)
            })
            .frame(width: 70.0, height: 100.0)
            .rotation3DEffect(isPressing ? .degrees(45) : .zero, axis: (x: 1, y: 0, z: 0))
            .animation(.easeInOut(duration: 0.2), value: isPressing)
            .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, perform: {}, onPressingChanged: { isPressing in
                self.isPressing = isPressing
            })
        }
    }
    
    private var speedometer: some View {
        TimelineView(.animation(minimumInterval: speed)) { context in
            GaugeView(
                animationDuration: speed,
                progress: progress,
                numberOfSegments: numberOfSegments,
                step: step
            )
            .onChange(of: context.date) { oldValue, newValue in
                let progress = if isPressing {
                    min(1.0, progress + 0.01)
                } else {
                    max(0.0, progress - 0.01)
                }
                
                guard self.progress != progress else { return }
                
                self.speed = if isPressing { 0.05 } else { 0.2 }
                withAnimation(.bouncy(duration: speed * 3.0)) {
                    self.progress = progress
                }
            }
            .frame(width: 300.0, height: 300.0)
        }
    }
}

#Preview {
    Example(numberOfSegments: 100, step: 10)
        .preferredColorScheme(.dark)
}
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue to discuss any changes or improvements.

## Contact

If you have any questions or feedback, feel free to contact me on [LinkedIn](https://www.linkedin.com/in/lidor-fadida/).
