//
//  UserDefaultsManager.swift
//
//
//  Created by JORDI GALLEN RENAU on 7/11/23.
//

import Foundation
import Domain
import Combine

public protocol UserDefaultsManager {
    
    func saveUsers(_ users: [User])
}
