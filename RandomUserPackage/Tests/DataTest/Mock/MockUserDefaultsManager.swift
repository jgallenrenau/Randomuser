//
//  MockUserDefaultsManager.swift
//
//
//  Created by JORDI GALLEN RENAU on 7/11/23.
//

import Foundation

@testable import Domain
@testable import Data

final class MockUserDefaultsManager: UserDefaultsManager {

    var saveUsers: ResultMethodStub<UserResultTO> = ResultMethodStub()
    
    func saveUsers(_ users: [User]) {}
}
