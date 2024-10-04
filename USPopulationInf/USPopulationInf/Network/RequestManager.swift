//
//  RequestManager.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import Foundation

enum PopulationInfoNetworkError: Error {
    
}

enum Request: RequestProtocol {
    case nationsInfo
    case statesInfo
    
    var scheme: String {
        "https://"
    }
    
    var host: String {
        "datausa.io"
    }
    
    var path: String {
        switch self {
        case .nationsInfo: return "/api/data?drilldowns=Nation&measures=Population"
        case .statesInfo: return "/api/data?drilldowns=State&measures=Population&year=latest"
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
        let urlString = "\(request.scheme)\(request.host)\(request.path)"
        guard let url = URL(string: urlString) else { return nil }
        return URLRequest(url: url)
    }
}
