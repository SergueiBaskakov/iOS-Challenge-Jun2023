//
//  Extensions.swift
//  
//
//  Created by Serguei Diaz on 22.06.2023.
//

import Foundation
import Combine
import SwiftUI

public extension Publisher {
    /// Perform a validation, if the validation succeeds the stream continues, otherwise it throws an error
    func validate(_ validator: @escaping (Output) throws -> Void
    ) -> Publishers.TryMap<Self, Output> {
        tryMap { output in
            try validator(output)
            return output
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
