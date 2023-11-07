import Foundation
import Moya
import Combine

// MARK: - Transformer -
typealias MoyaInternalApiCompletation = (Result<Moya.Response, Error>) -> Void

class MoyaCompletionTransformer {
    
    static func mapJsonDecoder<T: Decodable>(_ completion: @escaping (Result<T, Error>) -> Void) -> MoyaInternalApiCompletation {
        
        return { result in
            
            switch result {
                
            case .success(let response):
                do {
                    
                    let data = !response.data.isEmpty ? response.data : "{}".data(using: .utf8)!
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    
                    completion(.success(decodedResponse))
                } 
                catch {
                    
                    completion(.failure(error))
                }
                
            case .failure(let error):
                completion(.failure(error))
                return
            }
        }
    }
}

// MARK: - MoyaProvider -
extension MoyaProvider where Target: TargetType {
    
    func requestFilterErrors(_ target: Target, completion: @escaping MoyaInternalApiCompletation) {
        
        request(target) { result in
            
            switch result {
                
            case .success(let response):
                completion(.success(response))
                
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
}
