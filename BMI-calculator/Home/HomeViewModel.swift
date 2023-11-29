//
//  HomeViewModel.swift
//  BMI-calculator
//
//  Created by Guilherme Viana on 28/11/2023.
//

import UIKit

class HomeViewModel {
    
    public func calculateBMI(height: Float, weight: Float) -> String {
        let bmi = weight / pow(height, 2)
        let shorterBMI = String(format: "%.1f", bmi)
        return shorterBMI
    }    
}
