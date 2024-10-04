//
//  NationInfoViewModel.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import Foundation

struct NationInfoViewModel {
    private let dataItem: NationsDataItem
    init(dataItem: NationsDataItem) {
        self.dataItem = dataItem
    }
    
    var nation: String {
        dataItem.nation
    }
    
    var year: String {
        dataItem.year
    }
    
    var population: String {
        "\(dataItem.population)"
    }
}
