//
//  RepositoryAssembly.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation
import Data
import Domain

final class RepositoryAssembly {
    
    static func makeUsersRepository() -> Repository {
        
        return RepositoryImpl(apiManager: ApiAssembly.makeApiManager(url: "https://randomuser.me/api/"), 
                              userDefaultsManager: ApiAssembly.makeUserDefaultsManager())
    }
}
