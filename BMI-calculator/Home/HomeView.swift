//
//  HomeView.swift
//  BMI-calculator
//
//  Created by Guilherme Viana on 27/11/2023.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    func moveHeightSlider(sender: UISlider)
    func moveWeightSlider(sender: UISlider)
    func tappedCalculateButton(height: UISlider, weight: UISlider)
}

class HomeView: UIView {
    
    private weak var delegate: HomeViewProtocol?
    public func delegate(delegate: HomeViewProtocol) {
        self.delegate = delegate
    }
    
    lazy var bgView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPurple.withAlphaComponent(0.9)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CALCULATE \nYOUR BMI"
        label.textColor = .darkGray
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        return label
    }()
    
    lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Height"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var heightNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(heightSlider.value)m"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var heightSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 3
        slider.value = 1.50
        slider.tintColor = .systemPurple
        slider.addTarget(self, action: #selector(moveHeightSlider), for: .valueChanged)
        return slider
    }()
    
    @objc public func moveHeightSlider(sender: UISlider) {
        delegate?.moveHeightSlider(sender: heightSlider)
    }
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Weight"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var weightNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(weightSlider.value)kg"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var weightSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 300
        slider.value = 150
        slider.tintColor = .systemPurple
        slider.addTarget(self, action: #selector(moveWeightSlider), for: .valueChanged)
        return slider
    }()
    
    @objc public func moveWeightSlider(sender: UISlider) {
        delegate?.moveWeightSlider(sender: weightSlider)
    }
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        button.backgroundColor = .systemPurple
        button.clipsToBounds = true
        button.layer.cornerRadius = 13
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc public func tappedCalculateButton(height: UISlider, weight: UISlider) {
        delegate?.tappedCalculateButton(height: heightSlider, weight: weightSlider)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(bgView)
        bgView.addSubview(titleLabel)
        addSubview(heightLabel)
        addSubview(heightNumberLabel)
        addSubview(heightSlider)
        addSubview(weightLabel)
        addSubview(weightNumberLabel)
        addSubview(weightSlider)
        addSubview(calculateButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: topAnchor),
            bgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bgView.heightAnchor.constraint(equalToConstant: 400),
            
            titleLabel.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -50),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            heightLabel.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: -20),
            heightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            heightLabel.widthAnchor.constraint(equalToConstant: 150),
            
            heightNumberLabel.bottomAnchor.constraint(equalTo: heightSlider.topAnchor, constant: -20),
            heightNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            heightSlider.bottomAnchor.constraint(equalTo: weightLabel.topAnchor, constant: -20),
            heightSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            heightSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            weightLabel.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: -20),
            weightLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            weightLabel.widthAnchor.constraint(equalToConstant: 150),
            
            weightNumberLabel.bottomAnchor.constraint(equalTo: weightSlider.topAnchor, constant: -20),
            weightNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            weightSlider.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -40),
            weightSlider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            weightSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 60),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
        ])
    }

}
