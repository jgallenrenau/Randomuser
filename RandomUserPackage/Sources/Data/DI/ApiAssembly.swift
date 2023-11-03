//
//  ApiAssembly.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation

public class ApiAssembly {
    
    // MARK: - Providers -
    
    public static func makeApiManager(url: String) -> ApiManager {
        
        return ApiManagerImpl(provider: MoyaFactory.getProvider(
            baseUrlProvider: { url }
        ))
    }
}
