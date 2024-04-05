//
//  File.swift
//  
//
//  Created by Serguei Diaz on 25.06.2023.
//

import Foundation

public struct EnvironmentValues {
    public static var baseUrl: String {
        guard let info = Bundle.main.infoDictionary, let url = info["BASE_URL"] as? String else { fatalError("MISSING BASE URL") }
        
        return url
    }
}
