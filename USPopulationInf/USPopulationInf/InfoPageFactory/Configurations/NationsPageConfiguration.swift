//
//  NationPageConfiguration.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import Foundation

class NationsPageConfiguration: PageConfiguration {
    var pageName: String = "Nations"
    var type: PageType = .nations
    var requestType: any RequestProtocol = Request.nationsInfo
    
}
