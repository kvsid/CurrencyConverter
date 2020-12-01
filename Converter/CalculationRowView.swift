//
//  CalculationRowView.swift
//  Converter
//
//  Created by Xenia Sidorova on 01.12.2020.
//

import UIKit

class CalculationRowView: UIView {
    let currencyLabel = UILabel(frame: CGRect(x: 10, y: 35, width: 100, height: 31))
    let currencyField = UITextField(frame: CGRect(x: 250, y: 35, width: 100, height: 31))

    var delegateController: ConverterViewController?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray6

        setupCurrencyLabel()
        setupCurrencyField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCurrencyLabel() {
        self.addSubview(currencyLabel)
    }

    func setupCurrencyField() {
        currencyField.backgroundColor = .white
        currencyField.placeholder = "0.00"
        currencyField.borderStyle = .roundedRect
        currencyField.layer.borderColor = UIColor.systemYellow.cgColor
        currencyField.layer.borderWidth = 3
        currencyField.textAlignment = .center
        currencyField.contentVerticalAlignment = .center

        currencyField.delegate = self
        self.addSubview(currencyField)
    }
}

extension CalculationRowView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet(charactersIn: "0123456789.")
                .isSuperset(of: CharacterSet(charactersIn: string)) else { return false }

        return true
    }
}

class TopCalculationRowView: CalculationRowView {
    override func setupCurrencyLabel() {
        super.setupCurrencyLabel()
        if let controller = delegateController,
           let current = controller.currentCurrency {
            currencyLabel.text = current.cc
        }

        if let controller = delegateController,
           let first = controller.currencies.first {
            currencyLabel.text = first.cc
        } // Might be a hicup once model is connected.
    }

    func setupLabel(value: String) {
        currencyLabel.text = value
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let controller = delegateController {
            controller.calculateBottomCalculationRow(value: textField.text)
        }
    }
}

class BottomCalculationRowView: CalculationRowView {
    override func setupCurrencyLabel() {
        super.setupCurrencyLabel()
        currencyLabel.text = "UAH"
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let controller = delegateController {
            controller.calculateTopCalculationRow(value: textField.text)
        }
    }
}
