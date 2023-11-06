//
//  RandomUserApp.swift
//  RandomUser
//
//  Created by JORDI GALLEN RENAU on 31/10/23.
//

import SwiftUI
import SwiftData
import Presentation

@main
struct RandomUserApp: App {

    var body: some Scene {
        
        WindowGroup {
            
            UsersFeatureAssembly.usersFeature
        }
    }
}
