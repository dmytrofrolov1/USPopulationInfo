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
    private var configuration: PageConfiguration?

    // MARK: - Initializers

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private lazy var tableController: StatesInfoTableController = {
        let controller = StatesInfoTableController(tableView: tableView)
        return controller
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return control
    }()
    
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
        
        setupTableView()
    }

    
    private func setupTableView() {
        view.addSubview(tableView)
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.rightAnchor.constraint(equalTo: guide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: guide.leftAnchor)
        ])
        tableView.refreshControl = refreshControl
    }
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    @objc func refreshData() {
        guard let configuration = configuration else { return }
        interactor.loadData(request: configuration.requestType)
    }

}


// MARK: - StateInfoDisplayLogic

extension StateInfoViewController: StateInfoDisplayLogic {
    func presentGeneralError() {
        showGeneralError()
    }
    
    func present(data: [StateInfoViewModel]) {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
        
        tableController.reload(data: data)
    }
}

extension StateInfoViewController: InfoPage {
    func update(configuration: any PageConfiguration) {
        self.configuration = configuration
        interactor.loadData(request: configuration.requestType)
    }
    
    var pageName: String {
        configuration?.pageName ?? ""
    }
    
    var type: PageType {
        .states
    }
}
