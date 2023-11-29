//
//  HomeViewController.swift
//  BMI-calculator
//
//  Created by Guilherme Viana on 27/11/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var viewModel: HomeViewModel = HomeViewModel()
    private var screen: HomeView?
    
    override func loadView() {
        screen = HomeView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        signProtocols()
    }
    
    override func viewIsAppearing(_ animated: Bool) {
        screen?.heightSlider.value = 1.5
        screen?.heightNumberLabel.text = "1.50m"
        screen?.weightSlider.value = 150
        screen?.weightNumberLabel.text = "150.0kg"
    }
    
    private func signProtocols() {
        screen?.delegate(delegate: self)
    }
}

extension HomeViewController: HomeViewProtocol {
    func moveHeightSlider(sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        screen?.heightNumberLabel.text = "\(height)m"
    }
    
    func moveWeightSlider(sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        screen?.weightNumberLabel.text = "\(weight)kg"
    }
    
    func tappedCalculateButton(height: UISlider, weight: UISlider) {
        let bmi = viewModel.calculateBMI(height: height.value, weight: weight.value)
        let result = ResultViewController(resultValue: bmi)
        navigationController?.pushViewController(result, animated: true)
    }
}
