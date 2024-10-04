//
//  MainViewController.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var interactor: MainBusinessLogic!
    var router: MainRouterProtocol!

    private var pages = [InfoPage]()
    private var currentIndex: Int = 0

    private lazy var pageController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, 
                                      navigationOrientation: .horizontal,
                                      options: nil)
        vc.view.backgroundColor = .clear
        
        addChild(vc)
        view.addSubview(vc.view)
        vc.didMove(toParent: self)
        
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
           vc.view.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
           vc.view.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
           vc.view.topAnchor.constraint(equalTo: guide.topAnchor),
           vc.view.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
        
        return vc
    }()


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
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.output = presenter
        presenter.output = viewController
        router.viewController = viewController
    }

    private func setupPages() {
        let nationVC = InfoPageFactory().getPage(type: .nations)
        let stateVC = InfoPageFactory().getPage(type: .states)
        pages.append(nationVC)
        pages.append(stateVC)
        pageController.setViewControllers([nationVC],
                                          direction: .forward,
                                          animated: true,
                                          completion: nil)
    }
    
    
    private lazy var segmentControl: UISegmentedControl = {
        let pageNames = pages.map { $0.pageName }
        let control = UISegmentedControl(items: pageNames)
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        return control
    }()
    
    private func setupSegmentControl() {
        navigationItem.titleView = segmentControl
    }
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPages()
        setupSegmentControl()
    }
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let page = pages[index]
        var direction: UIPageViewController.NavigationDirection = .forward
        switch page.type {
        case .nations: direction = currentIndex > 0 ? .forward : .reverse
        case .states: direction = currentIndex == 0 ? .forward : .reverse
        }
        pageController.setViewControllers([page],
                                          direction: direction,
                                          animated: true,
                                          completion: nil)
        
    }

}


// MARK: - MainDisplayLogic

extension MainViewController: MainDisplayLogic {


    // MARK: - Display logic

}
