//
//  ResultViewController.swift
//  BMI-calculator
//
//  Created by Guilherme Viana on 28/11/2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    private var resultValue: Float
    private var screen: ResultView?
    
    init(resultValue: Float) {
        self.resultValue = resultValue
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        print(resultValue)
    }
    

}
