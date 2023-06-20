//
//  ButtonView.swift
//  TargetNumber
//
//  Created by Алексей Филиппов on 20.06.2023.
//

import SwiftUI

struct ButtonView: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
        .frame(width: 288, height: 56)
        .background(color)
        .cornerRadius(16)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "LOL", color: .blue, action: {})
    }
}
