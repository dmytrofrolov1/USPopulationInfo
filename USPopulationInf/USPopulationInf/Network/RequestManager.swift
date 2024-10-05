//
//  RequestManager.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import Foundation

enum Request: RequestProtocol {
    case nationsInfo
    case statesInfo
    
    var scheme: String {
        "https"
    }
    
    var host: String {
        "datausa.io"
    }
    
    var path: String {
        switch self {
        case .nationsInfo: return "/api/data"
        case .statesInfo: return "/api/data"
        }
    }
    
    var query: [[String : String]] {
        switch self {
        case .nationsInfo: return [["drilldowns" : "Nation"], 
                                   ["measures" : "Population"]]
            
        case .statesInfo: return [["drilldowns" : "State"],
                                  ["measures" : "Population"]]
        }
    }
    
    var method: String {
       "GET"
    }
}

class RequestManager: RequestManagerProtocol {
    
    private lazy var configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.default
        configuration.urlCache = URLCache(memoryCapacity: 10 * 1024 * 1024, diskCapacity: 10 * 1024 * 1024)
        
        return configuration
    }()
    
    private lazy var urlSession: URLSession = {
        let session = URLSession(configuration: configuration)
        return session
    }()
    
    func loadData<T>(request: RequestProtocol,
                     completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        
        guard let urlRequest = requestBuilder(request: request) else {
            //completion with error
            return
        }
        
        urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    private func requestBuilder(request: RequestProtocol) -> URLRequest? {
        var components = URLComponents()
        components.scheme = request.scheme
        components.host = request.host
        components.path = request.path
        
        let queryItems = request.query.compactMap({ dict -> URLQueryItem? in
            guard let key = dict.keys.first, let value = dict[key] else { return nil }
             return URLQueryItem(name: key, value:value )
        })
        
        components.queryItems = queryItems
        
        
        guard let url = components.url else { return nil }
        
        return URLRequest(url: url)
    }
}
