//
//  SliderView.swift
//  TargetNumber
//
//  Created by Алексей Филиппов on 20.06.2023.
//

import SwiftUI

struct SliderView: View {
    @StateObject private var compute = Compute()
    @State private var currentValue = 0.0
    
    var body: some View {
        HStack(spacing: 16) {
            Text("0")
            UISliderRepresentation(
                value: $currentValue,
                range: 1...100,
                step: 1,
                targetValue: compute.targetValue
            )
            Text("100")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
