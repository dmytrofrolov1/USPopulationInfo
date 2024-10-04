//
//  NationInfoViewController.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class NationInfoViewController: UIViewController  {

    var interactor: NationInfoBusinessLogic!
    var router: NationInfoRouterProtocol!
    private var configuration: PageConfiguration?

    // MARK: - Initializers

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = NationInfoInteractor()
        let presenter = NationInfoPresenter()
        let router = NationInfoRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.output = presenter
        presenter.output = viewController
        router.viewController = viewController
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

}


// MARK: - NationInfoDisplayLogic

extension NationInfoViewController: NationInfoDisplayLogic {


    // MARK: - Display logic

}

extension NationInfoViewController: InfoPage {
    func update(configuration: any PageConfiguration) {
        self.configuration = configuration
        interactor.loadData(request: configuration.requestType)
    }
    
    var pageName: String {
        configuration?.pageName ?? ""
    }
    
    var type: PageType {
        .nations
    }
    
}
