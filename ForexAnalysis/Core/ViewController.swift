//
//  ViewController.swift
//  ForexAnalisis
//
//  Created by David Londoño on 1/11/18.
//  Copyright © 2018 David Londoño. All rights reserved.
//

import UIKit
import RxSwift

class ViewController<T>: UIViewController {
    var viewModel: T!
    let disposeBag = DisposeBag()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        assertViewModel()
    }
}

private extension ViewController {
    func assertViewModel() {
        assert(viewModel != nil)
    }
}
