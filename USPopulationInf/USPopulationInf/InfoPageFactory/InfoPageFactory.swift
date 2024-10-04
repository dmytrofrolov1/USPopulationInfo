//
//  InfoPageFactory.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//

import UIKit

struct InfoPageFactory:PageFactory {
    
    func getPage(type: PageType) -> any InfoPage {
        switch type {
        case .nations:
            let vc = NationInfoViewController()
            vc.update(configuration: NationsPageConfiguration())
            return vc
        case .states:
            let vc = StateInfoViewController()
            vc.update(configuration: StatesPageConfiguration())
            return vc
        }
    }
    
}

