//
//  MoyaFactory.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation
import Moya

public class MoyaFactory {
        
    public static func getProvider<Target: TargetType>(baseUrlProvider: @escaping () -> String) -> MoyaProvider<Target> {
        
        return  MoyaProvider<Target>(
            endpointClosure: { (target: Target) -> Moya.Endpoint in rewriteBaseUrl(baseUrlProvider(), target)}
        )
    }

    private static func rewriteBaseUrl(_ baseUrl: String, _ target: TargetType) -> Moya.Endpoint {
        
        let base = URL(string: baseUrl)!
        let url = base.appendingPathComponent(target.path).absoluteString
        
        return  Endpoint(
            url: url,
            sampleResponseClosure: { .networkResponse(200, target.sampleData) },
            method: target.method,
            task: target.task,
            httpHeaderFields: target.headers
        )
    }
}
