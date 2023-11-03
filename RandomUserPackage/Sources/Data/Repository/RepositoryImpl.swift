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
    
    private static let maxResults = 20
    
    public init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
    
    public func getUsers(page: Int, completion: @escaping (Result<[User], Swift.Error>) -> Void) {
        
        apiManager.getUsers(page: page, results: RepositoryImpl.maxResults, completion: { result in
            
            switch result {
                
            case .success(let response):
                let map = UserMapper.map(input: response)
                completion(.success(map))
                
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
