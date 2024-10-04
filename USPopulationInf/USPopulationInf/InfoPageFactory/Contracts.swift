//
//  Contracts.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import UIKit

enum PageType {
    case nations
    case states
}

protocol PageConfiguration: AnyObject {
    var type: PageType { get set }
    var requestType: RequestProtocol { get }
    var pageName: String { get }
}

protocol InfoPage: UIViewController {
    func update(configuration: PageConfiguration)
    var pageName: String { get }
    var type: PageType { get }
}

protocol PageFactory {
    func getPage(type: PageType) -> InfoPage
}
