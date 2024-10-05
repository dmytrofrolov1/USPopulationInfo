//
//  StateInfoContract.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol StateInfoBusinessLogic {
    func loadData(request: RequestProtocol)
}

protocol StateInfoPresentationLogic {
    func loadedResult(result: Result<StatesDataModel, Error>)
}

protocol StateInfoDisplayLogic: AnyObject {
    func present(data:[StateInfoViewModel])
    func presentGeneralError()
}

protocol StateInfoRouterProtocol {

}
