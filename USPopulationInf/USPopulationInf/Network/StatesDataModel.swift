//
//  StatesDataModel.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import Foundation

struct StatesDataModel: Decodable {
    let data: [StatesDataItem]
}

struct StatesDataItem: Decodable {
    let id: String
    let state: String
    let year: String
    let population: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "ID State"
        case state = "State"
        case year = "Year"
        case population = "Population"
    }
}
