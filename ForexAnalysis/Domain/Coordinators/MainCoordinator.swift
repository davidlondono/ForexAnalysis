//
//  MainCoordinator.swift
//  ForexAnalisis
//
//  Created by David Londoño on 12/6/17.
//  Copyright © 2017 David Londoño. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var mainView: UITabBarController?
    
    func start() {
        mainView = UITabBarController();
        let pp = PipCalculatorViewController.instantiate(from: .main)
        pp.viewModel = PipCalculatorViewModel()
        let controllers: [UIViewController] = [pp]
        let navs = controllers
            .map{ UINavigationController(rootViewController: $0) }
        navs.forEach { (nav) in
            nav.navigationBar.prefersLargeTitles = true
        }
        mainView?.viewControllers = navs
    }
}
