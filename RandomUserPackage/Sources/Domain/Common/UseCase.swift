//
//  UseCase.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation

public protocol UseCaseParams {}
public struct NotUseCaseParams: UseCaseParams {}

open class UseCase<P: UseCaseParams> {}
