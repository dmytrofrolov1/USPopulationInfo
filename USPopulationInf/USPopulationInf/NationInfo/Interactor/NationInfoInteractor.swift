//
//  NationInfoInteractor.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NationInfoInteractor {

    var output: NationInfoPresentationLogic?
    private let requestManager = RequestManager()
}


// MARK: - NationInfoBusinessLogic

extension NationInfoInteractor: NationInfoBusinessLogic {
    func loadData(request: any RequestProtocol) {
        requestManager.loadData(request: request) { (result: Result<NationsDataModel, Error>) in
            print("result nations", result)
        }
    }

}
