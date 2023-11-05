//
//  UsersViewModel.swift
//  RandomUser
//
//  Created by JORDI GALLEN RENAU on 31/10/23.
//

import Foundation
import Domain
import Combine
import SwiftUI

public final class UsersViewModel: ObservableObject {
    
    @Published var users: [User] = []
    @Published var searchQuery = ""
    @Published var fetchedUsers: [User]? = nil

    var searchCancellable: AnyCancellable? = nil

    init() {
    
        searchCancellable = $searchQuery
            .removeDuplicates()
            .debounce(for: 0.6, scheduler:  RunLoop.main)
            .sink(receiveValue: { [weak self]str in
                
                guard let self = self else { return }
                
                if str == "" {
                    
                    self.fetchedUsers = nil
                }
                else {
                    
                    self.searchUser()
                }
            })
    }
    
    private func searchUser() {
        
        self.fetchedUsers = users.filter { user in
            
            return user.name.first.contains(searchQuery) ||
                user.name.last.contains(searchQuery) ||
                user.email.contains(searchQuery)
        }
    }
}
