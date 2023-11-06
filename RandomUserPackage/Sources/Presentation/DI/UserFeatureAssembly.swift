//
//  FeatureProvider.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation
import Domain
import SwiftUI

public typealias FeatureProvider<T> = ((T) -> AnyView)

public class UsersFeatureAssembly {
    
    public static var usersFeature: AnyView {
        
        UsersAssembly(getUsersUseCase: UseCaseAssembly.makeGetUsersUseCase()).build().wrapAnyView()
    }
    
    public static var detailUsers: FeatureProvider<User> = { user in
        
        DetailUserAssembly(user: user).build().wrapAnyView()
    }
}

extension View {
    
    func wrapAnyView() -> AnyView {
        
        AnyView(self)
    }
}
