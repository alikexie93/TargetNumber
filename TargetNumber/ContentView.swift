//
//  ContentView.swift
//  TargetNumber
//
//  Created by Алексей Филиппов on 20.06.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var compute = Compute()
    @State private var showAlert = false
    @State private var currentValue = 0.0
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Подвинь слайдер, как можно ближе к: \(compute.targetValue)")
            SliderView()
            ButtonView(
                title: "Проверить",
                color: .blue,
                action: { showAlert = true }
            )
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Результат"),
                    message: Text("Вы заработали \(compute.computeScore()) очков"),
                    dismissButton: .default(Text("OK")) {
                        compute.resetGame()
                    }
                )
            }
            ButtonView(
                title: "Заново",
                color: .pink,
                action: compute.resetGame
            )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
