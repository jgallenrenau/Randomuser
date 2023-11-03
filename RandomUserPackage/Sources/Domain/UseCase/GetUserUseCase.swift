//
//  GetUserUseCase.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation

public class GetUserUseCaseParams: UseCaseParams {
    
    public let page: Int

    public init(page: Int) {
        
        self.page = page
    }
}

public class GetUserUseCase: QueryCallableUseCase<[User], GetUserUseCaseParams> {
    
    private let repository: Repository
    
    public init(repository: Repository) {
        
        self.repository = repository
    }
    
    public override func execute(params: GetUserUseCaseParams? = nil,
                                 completion: @escaping ResultCompletion<[User]>) {
        
        guard let params = params else {
            completion(.failure(DomainError.notParams))
            return
        }
        
        repository.getUsers(page: params.page, completion: completion)
    }
}
