//
//  NationInfoContract.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol NationInfoBusinessLogic {
    func loadData(request: RequestProtocol)
}

protocol NationInfoPresentationLogic {
    func loadedResult(result: Result<NationsDataModel, Error>)
}

protocol NationInfoDisplayLogic: AnyObject {
    func present(data:[NationInfoViewModel])
    func presentGeneralError()
}

protocol NationInfoRouterProtocol {

}
