//
//  PipCalculatorViewController.swift
//  ForexAnalisis
//
//  Created by David Londoño on 12/19/17.
//  Copyright © 2017 David Londoño. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class PipCalculatorViewController: ViewController<PipCalculatorViewModelType> {

    @IBOutlet weak var portafolioAmmoutTF: UITextField!
    @IBOutlet weak var percentLoseTF: UITextField!
    @IBOutlet weak var pipsTF: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        (portafolioAmmoutTF.rx.textInput <-> viewModel.amount)
            .disposed(by: disposeBag)
        percentLoseTF.rx.value.orEmpty.bind(to: viewModel.percentLose)
            .disposed(by: disposeBag)
        pipsTF.rx.value.orEmpty.bind(to: viewModel.pips)
            .disposed(by: disposeBag)
        viewModel.answer.bind(to: answerLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
