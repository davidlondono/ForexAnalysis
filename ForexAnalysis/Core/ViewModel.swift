//
//  ViewModel.swift
//  ForexAnalisis
//
//  Created by David Londoño on 12/19/17.
//  Copyright © 2017 David Londoño. All rights reserved.
//

import RxSwift

protocol ViewModelType: class {
    func viewDidLoad()
}
class ViewModel<V> {
    let disposeBag = DisposeBag()
    var view: V!
    func viewDidLoad() {
        
    }
}
