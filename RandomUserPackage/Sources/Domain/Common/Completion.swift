//
//  Completion.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation

public typealias ResultCompletion<T> = (Result<T, Error>) -> Void
public typealias DefaultCompletion = () -> Void
