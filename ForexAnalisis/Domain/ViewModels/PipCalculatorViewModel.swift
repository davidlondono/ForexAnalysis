//
//  PipCalculatorViewModel.swift
//  ForexAnalisis
//
//  Created by David Londoño on 12/19/17.
//  Copyright © 2017 David Londoño. All rights reserved.
//

import RxSwift
import RxCocoa

protocol PipCalculatorViewModelType: ViewModelType {
    var pips: Variable<String> { get }
    var percentLose: Variable<String> { get }
    var amount: Variable<String> { get }
    var answer: Observable<String> { get }
}
class PipCalculatorViewModel: ViewModel<PipCalculatorViewController>, PipCalculatorViewModelType {
    
    let amount = Variable("")
    let percentLose = Variable("")
    let pips = Variable("")
    let answerNumber = BehaviorSubject(value: 0.0)
    
    lazy var answer: Observable<String> = answerNumber.map { "\($0)" }
    
    let responseText = Variable("")
    var pipStore = PipsCalculatorStore()
    
    lazy var amountNumber = amount.asObservable().map { $0.doubleValue }
    lazy var percentLoseNumber = percentLose.asObservable().map { $0.doubleValue }
    lazy var pipsNumber = pips.asObservable().map { $0.doubleValue }
    
    override init() {
        super.init()
        
        Observable.combineLatest(amountNumber, percentLoseNumber, pipsNumber)
            .map { (amount, percent, pips) in
                let ammountToLose = amount * (percent / 100)
                let valuePerPip = ammountToLose / pips
                return valuePerPip
        }
            .bind(to: answerNumber)
        .disposed(by: disposeBag)
    }
    override func viewDidLoad() {
        if let pipStoreValue = PipsCalculatorStore.load() {
            pipStore = pipStoreValue
            self.amount.value = pipStore.portafolio.description
        }
        
        amountNumber.distinctUntilChanged().bind { (amountPortafolio) in
            self.pipStore.portafolio = amountPortafolio
            self.pipStore.save()
        }
            .disposed(by: disposeBag)
    }
    
}
