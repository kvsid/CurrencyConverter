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
        self.backgroundColor = .lightGray // Remove me in the future

        setupCurrencyLabel()
        setupCurrencyField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCurrencyLabel(_ labelTitle: String = "UAH") {
        currencyLabel.text = labelTitle

        self.addSubview(currencyLabel)
    }

    func setupCurrencyField() {
        currencyField.backgroundColor = .white // Remove me in the future
        currencyField.placeholder = "0.00"
        currencyField.borderStyle = .roundedRect
        currencyField.layer.borderColor = CGColor(red: 100.0, green: 1.0, blue: 0.0, alpha: 1.0)
        currencyField.layer.borderWidth = 2
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
    let identifier = "TopCalculationRowView"

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let controller = delegateController {
            controller.calculateBottomCalculationRow(value: textField.text)
        }
    }
}

class BottomCalculationRowView: CalculationRowView {
    let identifier = "BottomCalculationRowView"

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let controller = delegateController {
            controller.calculateTopCalculationRow(value: textField.text)
        }
    }
}
