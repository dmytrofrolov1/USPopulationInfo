//
//  StateInfoViewModel.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import Foundation

struct StateInfoViewModel {
    private let dataItem: StatesDataItem
    init(dataItem: StatesDataItem) {
        self.dataItem = dataItem
    }
    
    var state: String {
        dataItem.state
    }
    
    var year: String {
        dataItem.year
    }
    
    var population: String {
        "\(dataItem.population)"
    }
}
