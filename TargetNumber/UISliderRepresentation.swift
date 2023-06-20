//
//  UISliderRepresentation.swift
//  TargetNumber
//
//  Created by Алексей Филиппов on 20.06.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    
    @Binding var value: Double
    let range: ClosedRange<Double>
    let step: Double
    let targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = Float(range.lowerBound)
        slider.maximumValue = Float(range.upperBound)
        slider.value = Float(value)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        let difference = abs(targetValue - lround(value))
        uiView.alpha = computeAlpha(difference: difference)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
    private func computeAlpha(difference: Int) -> CGFloat {
        let maxDifference = range.upperBound - range.lowerBound
        let alpha = 1 - CGFloat(difference) / CGFloat(maxDifference)
        return alpha
    }
}

extension UISliderRepresentation {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        UISliderRepresentation(value: .constant(1.0), range: 1...100, step: 1, targetValue: 1)
    }
}
