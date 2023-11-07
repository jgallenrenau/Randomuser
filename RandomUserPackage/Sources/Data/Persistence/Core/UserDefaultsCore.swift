//
//  UserDefaultsCore.swift
//  
//
//  Created by JORDI GALLEN RENAU on 7/11/23.
//

import Foundation

public enum KeyUserDefaults: String, CaseIterable {
    case user = "com.randomuser.user"
}

protocol UserDefaultsCore {

    func saveUsers(_ user: [UserTO]) throws
    func getUsers() -> [UserTO]?
}

// MARK: - Class -

public class UserDefaultsCoreImpl: UserDefaultsCore {

    private let userDefaults = UserDefaults.standard

    public func saveUsers(_ user: [UserTO]) throws {

        try userDefaults.setObject(user, forKey: KeyUserDefaults.user.rawValue)
    }

    public func getUsers() -> [UserTO]? {
        
        return userDefaults.array(forKey:  KeyUserDefaults.user.rawValue) as? [UserTO]
    }

    func cleanAll() {

        KeyUserDefaults.allCases.forEach { UserDefaults.standard.removeObject(forKey: $0.rawValue) }
    }
}
