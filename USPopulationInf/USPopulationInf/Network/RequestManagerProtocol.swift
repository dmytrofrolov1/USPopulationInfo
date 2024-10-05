//
//  RequestManagerProtocol.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import Foundation

protocol RequestProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var query: [[String: String]] { get }
    var method: String { get }

}

protocol RequestManagerProtocol {
    func loadData<T:Decodable>(request: RequestProtocol, completion: @escaping (Result<T, Error>) -> Void)
}
