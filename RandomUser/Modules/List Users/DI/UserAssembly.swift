//
//  UserAssembly.swift
//  RandomUser
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Domain
import SwiftUI

public class UsersAssembly {
    
    private let getUsersUseCase: QueryCallableUseCase<[User], GetUsersUseCaseParams>

    public init(getUsersUseCase: QueryCallableUseCase<[User], GetUsersUseCaseParams>) {
        self.getUsersUseCase = getUsersUseCase
    }
    
    public func build() -> some View {
        
        let store: UsersViewStore = UsersViewStore()
        var view: UsersView = UsersView(store: store)
        let params = GetUsersUseCaseParams(page: 0)
        
        view.onLoaded = {
            
            self.getUsersUseCase.execute(params: params, completion: { result in
                
                switch result {
                    
                case .success(let response):
                    store.users = response

                case .failure(let error):
                    print(error)
                }
            })
        }
                
        return view
    }

}
