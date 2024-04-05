//
//  ImagePlaceholder.swift
//  
//
//  Created by Serguei Diaz on 25.06.2023.
//

import SwiftUI

public struct ImagePlaceholder: View {
    
    public init(){}
    
    public var body: some View {
        Text("Image")
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .font(.system(size: 25, weight: .bold))
            .foregroundColor(.white)
            .padding()
            .background(
                Rectangle()
                    .foregroundColor(.teal)
            )
    }
}

struct ImagePlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        ImagePlaceholder()
    }
}
