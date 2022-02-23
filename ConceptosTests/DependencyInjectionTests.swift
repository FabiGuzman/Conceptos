//
//  DependencyInjectionTests.swift
//  ConceptosTests
//
//  Created by Fabian Antonio Guzman Gonzalez on 21/02/22.
//

import XCTest

class DependencyInjectionTests: XCTestCase {
    
    func testExample() throws {
        let productManager = MockProductManager()
        let viewModel = ViewModel()
        viewModel.manager = productManager
        XCTAssertEqual(viewModel.numberOfProducts(),4)
    }
}

class ViewModel {
    
    var manager: ProductManagerProtocol? {
        didSet {
            retrieveProducts()
        }
    }
    
    var products: [String] = []
    
    init() {
    }
    
    func retrieveProducts() {
        manager?.retrieveProducts {[weak self] products in
            for product in products {
                print("Product: \(product)")
                self?.products = products
            }
        }
    }
    
    func numberOfProducts() -> Int {
        return products.count
    }
}

protocol ProductManagerProtocol {
    func retrieveProducts(completion: @escaping ([String]) -> Void)
}

class MockProductManager: ProductManagerProtocol {
    func retrieveProducts(completion: @escaping ([String]) -> Void) {
        completion(["iPhone12","iPhone12Pro","iPhone11","iPhone11Pro"])
    }
}

class ProductManager: ProductManagerProtocol {
    func retrieveProducts(completion: @escaping ([String]) -> Void) {
        // Llamada a API
        // Consulta a base de datos
    }
}
