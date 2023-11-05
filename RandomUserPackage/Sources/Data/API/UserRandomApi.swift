//
//  UserRandomApi.swift
//
//
//  Created by JORDI GALLEN RENAU on 3/11/23.
//

import Foundation
import Moya

enum UserRandomApi: Equatable {
    
    case getUsers(page: Int, results: Int)
    
    static func == (lhs: UserRandomApi, rhs: UserRandomApi) -> Bool {
        
        return lhs.path == rhs.path && lhs.method == rhs.method
    }
}

extension UserRandomApi: TargetType, AccessTokenAuthorizable {
    
    var authorizationType: AuthorizationType? {
        
        switch self {
            
        case .getUsers:
            return .bearer
        }
    }
    
    
    var baseURL: URL {
        return URL(string: "https://api.randomuser.me/")!
    }
    
    var path: String {
        
        switch self {
            
        case .getUsers:
            return ""
        }
    }
    
    var method: Moya.Method {
        
        switch self {
            
        case .getUsers:
            return .get
        }
    }
    
    public var task: Task {
        
        switch self {
            
        case .getUsers(let page, let results):
            return .requestParameters(parameters: ["page": page, "results": results], encoding: URLEncoding.default)
//            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        return .none
    }
    
    public var sampleData: Data {
        
        return "".data(using: String.Encoding.utf8)!
    }
    
    public var headers: [String: String]? {
        return nil
    }
}
