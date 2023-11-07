//
//  MockRepository.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

@testable import Domain

final class MockRepository: Repository {
 
    var getUsers: ResultMethodStub<[User]> = ResultMethodStub()
    var saveUsers: ResultMethodStub<[User]> = ResultMethodStub()

    public init() {}

    func getUsers(page: Int, completion: @escaping (Result<[User], Swift.Error>) -> Void) {
        
        getUsers.doCall()
        completion(getUsers.result)
    }
    
    func saveUsers(users: [Domain.User]) {
        
        saveUsers.doCall()
    }

}
