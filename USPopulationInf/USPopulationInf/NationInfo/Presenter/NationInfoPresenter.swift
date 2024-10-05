//
//  NationInfoPresenter.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


class NationInfoPresenter {

    weak var output: NationInfoDisplayLogic?

}


// MARK: - NationInfoPresentationLogic

extension NationInfoPresenter: NationInfoPresentationLogic {
    func loadedResult(result: Result<NationsDataModel, any Error>) {
        switch result {
        case .success(let model):
            let viewModels = model.data.map{ NationInfoViewModel(dataItem: $0)}
            output?.present(data: viewModels)
            break
        case .failure(_):
            output?.presentGeneralError()
            break
        }
    }

}
