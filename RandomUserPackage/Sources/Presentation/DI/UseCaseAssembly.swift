//
//  UseCaseAssembly.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation
import Domain

public  class UseCaseAssembly {}

extension UseCaseAssembly {
    
    public static func makeGetUsersUseCase() -> QueryCallableUseCase<[User], GetUsersUseCaseParams> {
        
        GetUsersUseCase(repository: RepositoryAssembly.makeUsersRepository())
    }
}
