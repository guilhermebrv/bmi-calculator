//
//  ResultViewModel.swift
//  BMI-calculator
//
//  Created by Guilherme Viana on 29/11/2023.
//

import UIKit

class ResultViewModel {

    public func getAdvice(bmiValue: Float) -> String {
        switch bmiValue {
            case ..<18.5:
                return "Eat more pies!"
            case ..<24.9:
                return "Fit as a fiddle!"
            case 25...:
                return "Eat less pies!"
            default:
                return ""
        }
    }
    
    public func getBgColor(bmiValue: Float) -> UIColor {
        switch bmiValue {
            case ..<18.5:
                return UIColor.systemBlue
            case ..<24.9:
                return UIColor.systemGreen
            case 25...:
                return UIColor.systemRed
            default:
                return UIColor()
        }
    }
}
