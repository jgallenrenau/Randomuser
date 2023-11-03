//
//  MockApiManager.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation

@testable import Data

final class MockApiManager: ApiManager {

    var getUsers: ResultMethodStub<[UserTO]> = ResultMethodStub()

    func getUsers(page: Int,  results: Int, completion: @escaping (Result<[UserTO], Error>) -> Void) {
        
        getUsers.doCall(params: [page, results])
        completion(getUsers.result)
    }
}
