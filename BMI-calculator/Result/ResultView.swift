//
//  ResultView.swift
//  BMI-calculator
//
//  Created by Guilherme Viana on 28/11/2023.
//

import UIKit

protocol ResultViewProtocol: AnyObject {
    func tappedRecalculateButton()
}

class ResultView: UIView {
    
    private weak var delegate: ResultViewProtocol?
    public func delegate(delegate: ResultViewProtocol) {
        self.delegate = delegate
    }
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemCyan
        return view
    }()
    
    lazy var resultStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    lazy var yourResultLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .regular)
        label.text = "YOUR RESULT"
        return label
    }()
    
    lazy var resultNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 70, weight: .bold)
        return label
    }()
    
    lazy var adviceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .thin)
        label.text = "Eat more pies!"
        return label
    }()
    
    lazy var recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RECALCULATE", for: .normal)
        button.setTitleColor(.systemPurple, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.backgroundColor = .white
        button.clipsToBounds = true
        button.layer.cornerRadius = 13
        button.addTarget(self, action: #selector(tappedRecalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc public func tappedRecalculateButton() {
        delegate?.tappedRecalculateButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(bgView)
        bgView.addSubview(resultStack)
        resultStack.addArrangedSubview(yourResultLabel)
        resultStack.addArrangedSubview(resultNumberLabel)
        resultStack.addArrangedSubview(adviceLabel)
        bgView.addSubview(recalculateButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            resultStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            resultStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            resultStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            resultStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            recalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            recalculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            recalculateButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
