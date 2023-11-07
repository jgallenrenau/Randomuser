//
//  RepositoryImpl.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation
import Domain

public class RepositoryImpl: Repository {
    
    private let apiManager: ApiManager
    private let userDefaultsManager: UserDefaultsManager

    private static let maxResults = 20
    
    public init(apiManager: ApiManager,
                userDefaultsManager: UserDefaultsManager) {
        self.apiManager = apiManager
        self.userDefaultsManager = userDefaultsManager
    }
    
    public func getUsers(page: Int, completion: @escaping (Result<[User], Swift.Error>) -> Void) {
        
        apiManager.getUsers(page: page, results: RepositoryImpl.maxResults, completion: { result in
            
            switch result {
                
            case .success(let response):
                                
                let map = UserMapper.map(input: response)

                self.saveUsers(users: map.result)
                
                completion(.success(map.result))
                
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    public func saveUsers(users: [User]) {
        
        userDefaultsManager.saveUsers(users)
    }
}
