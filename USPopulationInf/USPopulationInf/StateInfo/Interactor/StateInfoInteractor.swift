//
//  StateInfoInteractor.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class StateInfoInteractor {

    var output: StateInfoPresentationLogic?
    private let requestManager = RequestManager()
}


// MARK: - StateInfoBusinessLogic

extension StateInfoInteractor: StateInfoBusinessLogic {

    func loadData(request: any RequestProtocol) {
        requestManager.loadData(request: request) { (result: Result<StatesDataModel, Error>) in
            print("result states:", result)
        }
    }

}
