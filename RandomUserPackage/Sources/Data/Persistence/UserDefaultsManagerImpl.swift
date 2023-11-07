//
//  UserDefaultsManagerImpl.swift
//
//
//  Created by JORDI GALLEN RENAU on 7/11/23.
//

import Foundation
import Combine
import Domain

public class UserDefaultsManagerImpl: UserDefaultsManager {

    private let provider: UserDefaultsManager
    
    init(provider: UserDefaultsManager) {
        
        self.provider = provider
    }
    
    public func saveUsers(_ users: [User]) {
        
        provider.saveUsers(users)
    }

}
