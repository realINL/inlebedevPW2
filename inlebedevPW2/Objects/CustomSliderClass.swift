//
//  CustomSliderClass.swift
//  inlebedevPW2
//
//  Created by Илья Лебедев on 12.10.2023.
//

import UIKit


final class CustomSlider: UIView {
    var valueChanged: ((Double) -> Void)?
    var slider = UISlider()
    var titleView = UILabel()
    var value: Double {
        get { return Double(slider.value) }
        set { slider.value = Float(newValue) }
    }
    init(value: Double, title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        self.value = value
        titleView.text = title
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        configureUI()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureUI() { backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        for view in [slider, titleView] {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            slider.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    @objc
    private func sliderValueChanged() {
        valueChanged?(Double(slider.value))
    }
}
