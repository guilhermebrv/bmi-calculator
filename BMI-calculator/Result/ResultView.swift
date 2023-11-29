//
//  ResultView.swift
//  BMI-calculator
//
//  Created by Guilherme Viana on 28/11/2023.
//

import UIKit

class ResultView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
        backgroundColor = .systemPink
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            //
        ])
    }
}
