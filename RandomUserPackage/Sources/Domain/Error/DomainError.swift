//
//  DomainError.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation

public protocol DomainErrorContract: Swift.Error { }

public enum DomainError: DomainErrorContract {
    
    case notParams
    case unknown
}
