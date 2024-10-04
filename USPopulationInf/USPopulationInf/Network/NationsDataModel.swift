//
//  DataModel.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import Foundation

struct NationsDataModel: Decodable {
    let data: [NationsDataItem]
}

struct NationsDataItem: Decodable {
    let id: String
    let nation: String
    let year: String
    let population: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "ID Nation"
        case nation = "Nation"
        case year = "Year"
        case population = "Population"
    }
}
