//
//  Compute.swift
//  TargetNumber
//
//  Created by Алексей Филиппов on 20.06.2023.
//

import Foundation
import Combine

final class Compute: ObservableObject {
    
    var currentValue = 0
    var targetValue = Int.random(in: 1...100)
    
    let objectWillChange = ObservableObjectPublisher()
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
    
    func resetGame() {
        currentValue = 50
        targetValue = Int.random(in: 1...100)
        
        objectWillChange.send()
    }
}
