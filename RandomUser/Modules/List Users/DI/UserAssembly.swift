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
        
        let viewModel: UsersViewModel = UsersViewModel()
        var view: UsersView = UsersView(viewModel: viewModel)
        let params = GetUsersUseCaseParams(page: viewModel.offset)
        
        view.onLoaded = {
            
            self.getUsersUseCase.execute(params: params, completion: { result in
                
                switch result {
                    
                case .success(let response):
                    viewModel.users.append(contentsOf: response)

                case .failure(let error):
                    print(error)
                }
            })
        }
                
        return view
    }

}
