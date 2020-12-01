//
//  CalculationRowView.swift
//  Converter
//
//  Created by Xenia Sidorova on 01.12.2020.
//

import UIKit

class CalculationRowView: UIView {
    let currencyLabel = UILabel(frame: CGRect(x: 10, y: 90, width: 100, height: 31))
    let currencyField = UITextField(frame: CGRect(x: 250, y: 90, width: 100, height: 31))

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green // Remove me in the future

        setupCurrencyLabel()
        setupCurrencyField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCurrencyLabel(_ labelTitle: String = "UAH") {
        currencyLabel.text = labelTitle
        currencyLabel.backgroundColor = .red // Remove me in the future

        self.addSubview(currencyLabel)
    }

    func setupCurrencyField() {
        currencyField.backgroundColor = .white // Remove me in the future
        currencyField.placeholder = "0.00"
        currencyField.borderStyle = .roundedRect

        currencyField.delegate = self
        self.addSubview(currencyField)
    }
}

extension CalculationRowView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("TEXT: \(textField.text!)")
    }
}

