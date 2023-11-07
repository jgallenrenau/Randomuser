//
//  SaveUsersUseCase.swift
//
//
//  Created by JORDI GALLEN RENAU on 7/11/23.
//

import Foundation

public class SaveUsersUseCaseParams: UseCaseParams {
    
    public let users: [User]

    public init(users: [User]) {
        
        self.users = users
    }
}

public class SaveUsersUseCase: QueryCallableUseCase<[User], SaveUsersUseCaseParams> {
    
    private let repository: Repository
    
    public init(repository: Repository) {
        
        self.repository = repository
    }
    
    public override func execute(params: SaveUsersUseCaseParams? = nil,
                                 completion: @escaping ResultCompletion<[User]>) {
        
        guard let params = params else {
            completion(.failure(DomainError.notParams))
            return
        }
        
        repository.saveUsers(users: params.users)
    }
    
}

