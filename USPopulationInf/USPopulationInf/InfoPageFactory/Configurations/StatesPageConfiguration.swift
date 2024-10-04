//
//  StatePageConfiguration.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import Foundation

class StatesPageConfiguration: PageConfiguration {
    var pageName: String = "States"
    var type: PageType = .states
    var requestType: any RequestProtocol = Request.statesInfo
}
