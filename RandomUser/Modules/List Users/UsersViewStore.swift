//
//  RandomUserApp.swift
//  RandomUser
//
//  Created by JORDI GALLEN RENAU on 31/10/23.
//

import Foundation
import Domain
import Combine
import SwiftUI

public final class UsersViewStore: ObservableObject {
    
    @Published var users: [User] = []
    
    init() {
    
    }
}
