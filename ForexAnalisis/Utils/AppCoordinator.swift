//
//  AppCoordinator.swift
//  ForexAnalisis
//
//  Created by David Londoño on 12/19/17.
//  Copyright © 2017 David Londoño. All rights reserved.
//

import UIKit

// from https://medium.com/@gurdeep060289/clean-code-for-multiple-storyboards-c64eb679dbf6
enum AppStoryboard: String {
    case main = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: .main)
    }
    
    func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        guard let vc = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("no found \(storyboardID) on storyboard \(self.rawValue)")
        }
        return vc
    }
    
    func instantiateViewController(with identifier: String) -> UIViewController? {
        return instance.instantiateViewController(withIdentifier: identifier)
    }
    
    func initialViewController() -> UIViewController? {
        return instance.instantiateInitialViewController()
    }
}
