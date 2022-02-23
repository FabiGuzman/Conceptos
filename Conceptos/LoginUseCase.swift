//
//  LoginUseCase.swift
//  Conceptos
//
//  Created by Fabian Antonio Guzman Gonzalez on 21/02/22.
//

import Foundation

public protocol LoginUseCaseProtocol {
    func login(completion: @escaping (Bool) -> Void)
}

public class LoginUseCase: LoginUseCaseProtocol {
    
    public init() {        
    }
    
    public func login(completion: @escaping (Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(true)
        }
    }
}
