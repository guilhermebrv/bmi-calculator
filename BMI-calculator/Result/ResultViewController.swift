//
//  ResultViewController.swift
//  BMI-calculator
//
//  Created by Guilherme Viana on 28/11/2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    private var resultValue: String
    private var screen: ResultView?
    private var viewModel: ResultViewModel = ResultViewModel()
    
    init(resultValue: String) {
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
        updateScreen()
        signProtocols()
    }
}

extension ResultViewController {
    
    private func updateScreen() {
        screen?.resultNumberLabel.text = resultValue
        if let result = Float(resultValue) {
            let color = viewModel.getBgColor(bmiValue: result)
            screen?.bgView.backgroundColor = color
            let advice = viewModel.getAdvice(bmiValue: result)
            screen?.adviceLabel.text = advice
        }
    }
    
    private func signProtocols() {
        screen?.delegate(delegate: self)
    }
    
}

extension ResultViewController: ResultViewProtocol {
    func tappedRecalculateButton() {
        navigationController?.popViewController(animated: true)
    }
}
