//
//  RestHandler.swift
//  
//
//  Created by Serguei Diaz on 22.06.2023.
//

import Foundation
import Combine
import Utils
import Domain

public struct RestHandler {
            
    private var scheme: Scheme = .https
    
    private var httpMethod: HTTPMethod = .get
    
    private var host: String = ""
    
    private var path: String = ""
    
    private var authorization: String = ""
    
    private var query: [String : [String]] = [:]
        
    private var contentType: String = "application/json"
    
    private var body: [String : Any] = [:]
        
    public init(){}
    
    public init(_ restHandler: RestHandler) {
        self.scheme = restHandler.scheme
        self.httpMethod = restHandler.httpMethod
        self.host = restHandler.host
        self.path = restHandler.path
        self.authorization = restHandler.authorization
        self.query = restHandler.query
        self.body = restHandler.body
    }
    
    public func scheme(_ scheme: Scheme) -> RestHandler {
        
        var restHandler = RestHandler(self)
        
        restHandler.scheme = scheme
        
        return restHandler
    }
    
    public func host(_ host: String) -> RestHandler {
        
        var restHandler = RestHandler(self)
        
        restHandler.host = host
        
        return restHandler
    }
    
    public func path(_ path: String) -> RestHandler {
        
        var restHandler = RestHandler(self)
        
        restHandler.path = path
        
        return restHandler
    }
    
    public func authorization(_ auth: String) -> RestHandler {
        
        var restHandler = RestHandler(self)
        
        restHandler.authorization = auth
        
        return restHandler
    }
    
    public func addQuery(_ query: [String : [String]]) -> RestHandler {
        
        var restHandler = RestHandler(self)
        
        query.keys.forEach { key in
            if let value = query[key] {
                restHandler.query[key] = value
            }
        }
        
        return restHandler
    }
    
    public func addQuery(_ query: [String : String]) -> RestHandler {
        
        var restHandler = RestHandler(self)

        query.keys.forEach { key in
            if let value = query[key] {
                var valueArray: [String] = []
                valueArray.append(value)
                restHandler.query[key] = valueArray
            }
        }
        
        return restHandler
    }
    
    public func addBody(_ body: [String : Any]) -> RestHandler {
        
        var restHandler = RestHandler(self)

        restHandler.body = body
        
        return restHandler
    }

    public func execute<T: Decodable>(_ httpMethod: HTTPMethod, decoding: T.Type, decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
        var urlComponents = URLComponents()
        
        let queryItems = generateQuery(self.query)
                
        urlComponents.scheme = self.scheme.rawValue
        
        urlComponents.host = self.host
        
        urlComponents.path = self.path
       
        if !queryItems.isEmpty {
            urlComponents.queryItems = queryItems
        }
                        
        guard let url = urlComponents.url
        else {
            fatalError("\(Self.self): Cannot build a URLRequest with an ill defined base url.")
        }
     
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = httpMethod.rawValue
        
        urlRequest.setValue(self.contentType, forHTTPHeaderField: "Content-Type")
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
                
        urlRequest.setValue(self.authorization, forHTTPHeaderField: "Authorization")
       
        if !self.body.isEmpty {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: self.body, options: [])
        }
                
        return URLSession(configuration: .default)
            .dataTaskPublisher(for: urlRequest)
            .receive(on: RunLoop.main)
            .validate { data, response in
                guard let response = response as? HTTPURLResponse
                else {
                    throw PredefinedError.invalidHTTPResponse
                }
                
                printDebugInfo(from: data, body: body, request: urlRequest, response: response)
                
            }
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
