//
//  DetailUserAssembly.swift
//  RandomUser
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Domain
import SwiftUI

public class DetailUserAssembly {
    
    private let user: User

    public init(user: User) {
        self.user = user
    }
    
    public func build() -> some View {
        
        var view: DetailUserView = DetailUserView(user: user)
                
        return view
    }
}
