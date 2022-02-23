//
//  LoginTests.swift
//  ConceptosTests
//
//  Created by Fabian Antonio Guzman Gonzalez on 21/02/22.
//

import XCTest
import Conceptos

class LoginTests: XCTestCase {

    func test_memoryLeaksClasses() {
        var vc: LoginViewController? = LoginViewController()
        var presenter: LoginPresenter? = LoginPresenter(view: vc!)
        vc?.presenter = presenter
        
        presenter = nil
        
        addTeardownBlock { [weak vc, weak presenter] in
            XCTAssertNil(vc)
            XCTAssertNil(vc?.presenter)
            XCTAssertNil(presenter)
        }
    }
    
    func test_memoryLeaksClosureAndPresenter() {
        let vc = LoginViewController()
        let loginUseCase = LoginUseCase()
        let presenter = LoginPresenter(view: vc, loginUseCase: loginUseCase)
        vc.presenter = presenter
        
        presenter.login()
        
        addTeardownBlock { [weak vc, weak presenter] in
            XCTAssertNil(vc)
            XCTAssertNil(presenter)
        }
    }
}
