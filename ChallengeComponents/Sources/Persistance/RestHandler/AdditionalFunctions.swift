//
//  AdditionalFunctions.swift
//  
//
//  Created by Serguei Diaz on 22.06.2023.
//

import Foundation

extension RestHandler {
    public func generateQuery(_ queryArray: [String : [String]]) -> [URLQueryItem] {
        var query: [URLQueryItem] = []

        queryArray.keys.forEach { key in
            queryArray[key]?.forEach({ value in
                if value != "" {
                    query.append(URLQueryItem(name: key, value: value))
                }
            })
        }
        
        return query
    }
    public func printDebugInfo(from data: Data, body: [String : Any], request: URLRequest, response: HTTPURLResponse) {
        print("-----------DEBUGGING-----------")
        if let url = response.url {
            print("Path: \(url)")
        }
        
        print("Body: \(body)")
        
        print("Result: HTTP Status Code \(response.statusCode) \(StatusCode(rawValue: response.statusCode) ?? StatusCode.invalidData)")
        
        if let encrypted2 = try?  JSONSerialization.jsonObject(with: data, options: .mutableContainers),
           let encryptedPTT2 = try? JSONSerialization.data(withJSONObject: encrypted2, options: .prettyPrinted) {
            print("\n Response:\n \(String(decoding: encryptedPTT2, as: UTF8.self)) \n\n")
        }
        
        print("--------------------------------")
    }

}
