//
//  ApiManager.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation
import Moya
import Domain
import Combine

public protocol ApiManager {
    func getUsers(page: Int, results: Int, completion: @escaping (Result<UserResultTO, Error>) -> Void)
}
