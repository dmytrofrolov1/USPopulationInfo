//
//  StateInfoPresenter.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


class StateInfoPresenter {

    weak var output: StateInfoDisplayLogic?

}


// MARK: - StateInfoPresentationLogic

extension StateInfoPresenter: StateInfoPresentationLogic {

    func loadedResult(result: Result<StatesDataModel, any Error>) {
        switch result {
        case .success(let model):
            let viewModels = model.data.map{ StateInfoViewModel(dataItem: $0)}
            output?.present(data: viewModels)
            break
        case .failure(_):
            output?.presentGeneralError()
            break
        }
    }

}
