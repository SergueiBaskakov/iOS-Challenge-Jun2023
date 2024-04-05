//
//  MapperProtocol.swift
//  
//
//  Created by Serguei Diaz on 24.06.2023.
//

import Foundation

protocol MapperProtocol: Codable {
    associatedtype T
    
    func execute() -> T
}
