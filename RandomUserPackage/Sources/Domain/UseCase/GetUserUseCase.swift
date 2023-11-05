//
//  GetUserUseCase.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation

public class GetUsersUseCaseParams: UseCaseParams {
    
    public let page: Int

    public init(page: Int) {
        
        self.page = page
    }
}

public class GetUsersUseCase: QueryCallableUseCase<[User], GetUsersUseCaseParams> {
    
    private let repository: Repository
    
    public init(repository: Repository) {
        
        self.repository = repository
    }
    
    public override func execute(params: GetUsersUseCaseParams? = nil,
                                 completion: @escaping ResultCompletion<[User]>) {
        
        guard let params = params else {
            completion(.failure(DomainError.notParams))
            return
        }
        
        repository.getUsers(page: params.page, completion: completion)
    }
}
