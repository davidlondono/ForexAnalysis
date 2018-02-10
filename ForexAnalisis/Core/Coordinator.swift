//
//  Coordinator.swift
//  ForexAnalisis
//
//  Created by David Londoño on 12/6/17.
//  Copyright © 2017 David Londoño. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    associatedtype MainController
    var mainView: MainController? { get set }
    func start()
    
}
