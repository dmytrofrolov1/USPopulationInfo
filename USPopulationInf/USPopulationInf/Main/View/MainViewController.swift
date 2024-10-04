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

    private var pages = [UIViewController]()
    private var currentIndex: Int = 0

    private lazy var pageController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, 
                                      navigationOrientation: .horizontal,
                                      options: nil)
        vc.view.backgroundColor = .clear
        vc.dataSource = self
        vc.delegate = self
        
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
    
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPages()
    }

}


// MARK: - MainDisplayLogic

extension MainViewController: MainDisplayLogic {


    // MARK: - Display logic

}

extension MainViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentIndex
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController), currentIndex > 0 else {
             return nil
         }
         return pages[currentIndex - 1]
     }
     
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
         guard let currentIndex = pages.firstIndex(of: viewController), currentIndex < (pages.count - 1) else {
             return nil
         }
         return pages[currentIndex + 1]
     }
}
