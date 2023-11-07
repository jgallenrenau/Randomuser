//
//  ApiManagerImpl.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation
import Moya
import Combine
import Domain

public class ApiManagerImpl: ApiManager {

    private let provider: MoyaProvider<UserRandomApi>
    
    init(provider: MoyaProvider<UserRandomApi>) {
        
        self.provider = provider
    }
}

extension ApiManagerImpl {
    
    public func getUsers(page: Int, results: Int, completion: @escaping (Result<UserResultTO, Error>) -> Void) {
        
        provider.requestFilterErrors(.getUsers(page: page, results: results),
                                     completion: MoyaCompletionTransformer.mapJsonDecoder(completion))
    }
}
