//
//  ButtonStyles.swift
//  
//
//  Created by Serguei Diaz on 23.06.2023.
//

import Foundation
import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    
    public init(){}
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 16, weight: .bold))
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.teal)
            .overlay {
                Color.white.opacity(configuration.isPressed ? 0.2 : 0)
            }
            .cornerRadius(10)
            .shadow(radius: 4, x: 0, y: 4)

    }
}
