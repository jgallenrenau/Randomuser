//
//  CompletionResultCaptor.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation
import XCTest
import Domain

final class CompletionResultCaptor<T> {
    
    private let testCase: XCTestCase
    private var result: Result<T, Error>? = .none
    
    init(testCase: XCTestCase) {
        self.testCase = testCase
    }
    
    func capture() -> (Result<T, Error>) -> Void {
        
        let expectation = testCase.expectation(description: "capture Result")
        let wrapper: ((Result<T, Error>) -> Void) = { result in
            
            self.result = result
            
            expectation.fulfill()
        }
        
        return wrapper
    }
    
    func waitAndGet() -> T? {
        
        testCase.waitForExpectations(timeout: 1, handler: nil)
        
        if case .success(let value) = result {
            return value
        }

        return .none
    }
    
    func error() -> Error? {
        
        if case .failure(let error) = result {
            return error
        }
        return .none
    }
}
