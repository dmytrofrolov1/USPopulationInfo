//
//  StateInfoViewController.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class StateInfoViewController: UIViewController {

    var interactor: StateInfoBusinessLogic!
    var router: StateInfoRouterProtocol!


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
        let interactor = StateInfoInteractor()
        let presenter = StateInfoPresenter()
        let router = StateInfoRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.output = presenter
        presenter.output = viewController
        router.viewController = viewController
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }

}


// MARK: - StateInfoDisplayLogic

extension StateInfoViewController: StateInfoDisplayLogic {


    // MARK: - Display logic

}
