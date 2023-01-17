//
//  APIRequest.swift
//  SwiftUIBlueprint
//
//  Created by Dino Trnka on 16. 1. 2023..
//

import Foundation

typealias CompletionHandler = (Data) -> Void
typealias FailureHandler = (APIError) -> Void

struct EmptyRequest: Encodable {}
struct EmptyResponse: Decodable {}

enum HTTPMethod: String {
    case get
    case put
    case delete
    case post
}

class APIRequest<Parameters: Encodable, Model: Decodable> {
    
    static func call(
        scheme: String = Config.shared.scheme,
        host: String = Config.shared.host,
        path: String,
        method: HTTPMethod,
        authorized: Bool = false,
        queryItems: [URLQueryItem]? = nil,
        parameters: Parameters? = nil,
        completion: @escaping CompletionHandler,
        failure: @escaping FailureHandler
    ) {
        if !NetworkMonitor.shared.isReachable {
            return failure(.noInternet)
        }
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        
        if let queryItems = queryItems {
            components.queryItems = queryItems
        }
        
        guard let url = components.url else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("true", forHTTPHeaderField: "x-mock-match-request-body")
        
        if let parameters = parameters {
            request.httpBody = try? JSONEncoder().encode(parameters)
        }
    
        if authorized, let token = Auth.shared.getAccessToken() {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let data = data {
                completion(data)
            } else {
                if error != nil {
                    failure(APIError.response)
                }
            }
        }
        task.resume()
    }
}
