//
//  NavigationBar.swift
//  
//
//  Created by Serguei Diaz on 24.06.2023.
//

import SwiftUI

public extension View {
    func navigationBar(title: String) -> some View {
        self.modifier(NavigationBarModifier(title: title))
    }
}

public struct NavigationBarModifier: ViewModifier {
    
    @Environment(\.presentationMode) var presentationMode
    
    let title: String

    public func body(content: Content) -> some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                Button(action: {
                }) {
                    Image(systemName: "arrow.backward")
                }
                .hidden()
            }
            .padding()
            .background(
                RoundedCorner(radius: 10, corners: [.bottomLeft, .bottomRight])
                    .foregroundColor(.teal)
                    .ignoresSafeArea(.all)
                    .ignoresSafeArea(.all)
                    .shadow(radius: 4, x: 0, y: 4)
            )
            
            content
        }
        .navigationBarHidden(true)

    }
}

struct NavigationBarModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
        }
        .navigationBar(title: "Title")
    }
}
