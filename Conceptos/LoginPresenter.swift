//
//  LoginPresenter.swift
//  Conceptos
//
//  Created by Fabian Antonio Guzman Gonzalez on 21/02/22.
//

import Foundation

public protocol LoginPresenterProtocol: class{}

public class LoginPresenter: LoginPresenterProtocol {
    var view: LoginViewProtocol
    var loginUseCase: LoginUseCaseProtocol?
    
    public init(view: LoginViewProtocol,loginUseCase: LoginUseCaseProtocol? = nil) {
        self.view = view
        self.loginUseCase = loginUseCase
    }
    
    public func login() {
        loginUseCase?.login() { [weak self] result in
            if result {
                self?.updateUI()
            }
        }
    }
    
    func updateUI() {
        //update UI
    }
}
