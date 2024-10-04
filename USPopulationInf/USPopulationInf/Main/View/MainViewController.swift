//
//  MainViewController.swift
//  USPopulationInf
//
//  Created by Dmytro on 04.10.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    private enum Const {
        enum Pages: Int {
            case nations
            case states
            
            var pageName: String {
                switch self {
                case .nations: return "Nations"
                case .states: return "States"
                }
            }
        }
    }

    var interactor: MainBusinessLogic!
    var router: MainRouterProtocol!

    private var pages = [UIViewController]()
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
        let nationVC = NationInfoViewController()
        let stateVC = StateInfoViewController()
        pages.append(nationVC)
        pages.append(stateVC)
        pageController.setViewControllers([nationVC],
                                          direction: .forward,
                                          animated: true,
                                          completion: nil)
    }
    
    
    private lazy var segmentControl: UISegmentedControl = {
        let control = UISegmentedControl(items: [Const.Pages.nations.pageName, Const.Pages.states.pageName])
        control.selectedSegmentIndex = Const.Pages.nations.rawValue
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
        var page = pages[Const.Pages.nations.rawValue]
        var direction: UIPageViewController.NavigationDirection = .forward
        switch index {
        case Const.Pages.nations.rawValue:
            page = pages[Const.Pages.nations.rawValue]
            direction = currentIndex > 0 ? .forward : .reverse
        case Const.Pages.states.rawValue:
            page = pages[Const.Pages.states.rawValue]
            direction = currentIndex == 0 ? .forward : .reverse
        default:
            page = pages[Const.Pages.nations.rawValue]
            direction = .forward
            
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
