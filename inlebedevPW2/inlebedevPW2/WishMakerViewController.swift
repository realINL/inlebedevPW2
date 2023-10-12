//
//  ViewController.swift
//  inlebedevPW2
//
//  Created by Илья Лебедев on 10.10.2023.
//

import UIKit

final class WishMakerController: UIViewController {
    
    private let ResetButton = UIButton()
    private let HideSlidersButton = UIButton()
    private let ShowSlidersButton = UIButton()
    private let Description = UILabel()
    private let Title = UILabel()
    private var Stack = UIStackView()
    private var sliderRed = CustomSlider(value: Fields.red, title: Fields.redText, min: Fields.min, max: Fields.max)
    private var sliderBlue = CustomSlider(value: Fields.blue, title: Fields.blueText, min: Fields.min, max: Fields.max)
    private var sliderGreen = CustomSlider(value: Fields.green, title: Fields.greenText, min: Fields.min, max: Fields.max)
    
    
    enum Fields {
        //static let h: Double = 20
        static let red: Double = 1.0
        static let green: Double = 85/255
        static let blue: Double = 45/255
        static let min: Double = 0
        static let max: Double = 1
        static let redText: String = "Red"
        static let greenText: String = "Green"
        static let blueText: String = "Blue"
        
        static let titleText: String = "WishMaker"
        static let titleFont: Double = 32
        static let titleAnchor: Double = 30
        
        static let DescriptionText: String = "Dreams to reality"
        static let DescriptionFont: Double = 16
        static let DescriptionAnchor: Double = 20
        
        static let ButtonCornerRadius: Double = 7
        static let ButtonFont: Double = 14
        
        static let StackCornerRadius: Double = 20
        static let StackLeadingAnchorConst: Double = 20
        static let StackBottomAnchorConst: Double = -40
        
        static let ResetText: String = "Reset"
        static let ResetButtonWidt: Double = 60
        static let ResetButtonHeight: Double = 20
        static let ResetButtonPinTopConst: Double = 50
        
        static let SliderButtonWidt: Double = 120
        static let SliderButtonHeight: Double = 30
        static let SliderButtonPinTopConst: Double = 10
        
        static let HideButtonText: String = "Hide sliders"
        static let ShowButtonText: String = "Show sliders"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        configureUI()
    }
    
    
    private func configureUI() {
        view.backgroundColor = .systemPink
        
        configureTitle()
        configureDescription()
        configureSliders()
        configurerResetButton()
        configurerHideSlidersButton()
        ShowSlidersButton.isHidden = true
        configurerShowSlidersButton()
    }
    
    private func configureTitle() {
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.text = Fields.titleText
        Title.font = UIFont.systemFont(ofSize: Fields.titleFont)
        view.addSubview(Title)
        NSLayoutConstraint.activate([
            Title.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Title.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Fields.titleAnchor)
        ]) }
    
    private func configureDescription() {
        
        Description.translatesAutoresizingMaskIntoConstraints = false
        //description.textColor = .white
        Description.text = Fields.DescriptionText
        Description.font = UIFont.systemFont(ofSize: Fields.DescriptionFont)
        view.addSubview(Description)
        NSLayoutConstraint.activate([
            Description.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Description.pinTop(to: Title.bottomAnchor, Fields.DescriptionAnchor)
        ]) }
    
    
    
    private func configureSliders() {
        Stack = UIStackView()
        Stack.translatesAutoresizingMaskIntoConstraints = false
        Stack.axis = .vertical
        view.addSubview(Stack)
        Stack.layer.cornerRadius = Fields.StackCornerRadius
        Stack.clipsToBounds = true
        
        for slider in [sliderRed, sliderBlue, sliderGreen] {
            Stack.addArrangedSubview(slider)
        }
        NSLayoutConstraint.activate([
            Stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            Stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Fields.StackLeadingAnchorConst),
            Stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Fields.StackBottomAnchorConst)
        ])
        sliderRed.tintColor = .red
        sliderBlue.tintColor = .blue
        sliderGreen.tintColor = .green
        
        sliderRed.valueChanged = { [weak self] value in
            self?.view.backgroundColor = UIColor(
                red: value,
                green: ((self?.view.backgroundColor?.cgColor.components![1])!),
                blue: ((self?.view.backgroundColor?.cgColor.components![2])!),
                alpha: 1)
        }
        sliderBlue.valueChanged = { [weak self] value in
            self?.view.backgroundColor = UIColor(
                red: ((self?.view.backgroundColor?.cgColor.components![0])!),
                green: ((self?.view.backgroundColor?.cgColor.components![1])!),
                blue: value,
                alpha: 1)
        }
        
        sliderGreen.valueChanged = { [weak self] value in
            self?.view.backgroundColor = UIColor(
                red: ((self?.view.backgroundColor?.cgColor.components![0])!),
                green: value,
                blue: ((self?.view.backgroundColor?.cgColor.components![2])!),
                alpha: 1)
        }
        
        
        
    }

    
    private func configurerResetButton() {
        ResetButton.translatesAutoresizingMaskIntoConstraints = false
        ResetButton.layer.cornerRadius = Fields.ButtonCornerRadius
        ResetButton.setTitle(Fields.ResetText, for: .normal)
        ResetButton.setTitleColor(.black, for: .normal)
        ResetButton.titleLabel?.font = UIFont.systemFont(ofSize: Fields.ButtonFont)
        ResetButton.backgroundColor = .white
        view.addSubview(ResetButton)
        ResetButton.setWidth(Fields.ResetButtonWidt)
        ResetButton.setHeight(Fields.ResetButtonHeight)
        ResetButton.pinCenterX(to: view.centerXAnchor)
        ResetButton.pinTop(to: Description.bottomAnchor, Fields.ResetButtonPinTopConst)
        ResetButton.addTarget(self, action: #selector(buttonShowWasPressed), for: .touchUpInside)
        
    }
    
    private func configurerHideSlidersButton() {
        HideSlidersButton.translatesAutoresizingMaskIntoConstraints = false
        HideSlidersButton.layer.cornerRadius = Fields.ButtonCornerRadius
        HideSlidersButton.setTitle(Fields.HideButtonText, for: .normal)
        HideSlidersButton.setTitleColor(.black, for: .normal)
        HideSlidersButton.titleLabel?.font = UIFont.systemFont(ofSize: Fields.ButtonFont)
        HideSlidersButton.backgroundColor = .white
        view.addSubview(HideSlidersButton)
        HideSlidersButton.setWidth(Fields.SliderButtonWidt)
        HideSlidersButton.setHeight(Fields.SliderButtonHeight)
        HideSlidersButton.pinCenterX(to: view.centerXAnchor)
        HideSlidersButton.pinTop(to: Description.bottomAnchor, Fields.SliderButtonPinTopConst)
        
        HideSlidersButton.addTarget(self, action: #selector(buttonHideSlidersWasPressed), for: .touchUpInside)

    }

    private func configurerShowSlidersButton() {
        ShowSlidersButton.translatesAutoresizingMaskIntoConstraints = false
        ShowSlidersButton.layer.cornerRadius = Fields.ButtonCornerRadius
        ShowSlidersButton.setTitle(Fields.ShowButtonText, for: .normal)
        ShowSlidersButton.setTitleColor(.black, for: .normal)
        ShowSlidersButton.titleLabel?.font = UIFont.systemFont(ofSize: Fields.ButtonFont)
        ShowSlidersButton.backgroundColor = .white
        view.addSubview(ShowSlidersButton)
        ShowSlidersButton.setWidth(Fields.SliderButtonWidt)
        ShowSlidersButton.setHeight(Fields.SliderButtonHeight)
        ShowSlidersButton.pinCenterX(to: view.centerXAnchor)
        ShowSlidersButton.pinTop(to: Description.bottomAnchor, Fields.SliderButtonPinTopConst)
        ShowSlidersButton.addTarget(self, action: #selector(buttonShowSlidersWasPressed), for: .touchUpInside)
        
    }
    
    @objc func buttonShowWasPressed() {
        view.backgroundColor = .systemPink
        sliderRed.value = Fields.red
        sliderBlue.value = Fields.blue
        sliderGreen.value = Fields.green

    }
    
    @objc func buttonHideSlidersWasPressed() {
        Stack.isHidden = true
        HideSlidersButton.isHidden = true
        ShowSlidersButton.isHidden = false

    }

    @objc func buttonShowSlidersWasPressed() {
        Stack.isHidden = false
        HideSlidersButton.isHidden = false
        ShowSlidersButton.isHidden = true
    }
}
