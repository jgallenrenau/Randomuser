//
//  Repository.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation

public protocol Repository {
    func getUsers(page: Int, completion: @escaping (Result<[User], Swift.Error>) -> Void)
    func saveUsers(users: [User])
}
