//
//  Loader.swift
//  
//
//  Created by Serguei Diaz on 24.06.2023.
//

import SwiftUI

public extension View {
    func loader(isLoading: Bool) -> some View {
        self.modifier(LoaderViewModifier(isLoading: isLoading))
    }
}

struct LoaderViewModifier: ViewModifier {
    let isLoading: Bool
    
    func body(content: Content) -> some View {
        
        if isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        else {
            content
            
        }
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            Color.black
            Spacer()
        }
        .loader(isLoading: true)
    }
}
