//
//  ConverterViewController.swift
//  Converter
//
//  Created by Xenia Sidorova on 30.11.2020.
//

import UIKit

class ConverterViewController: UIViewController {
    var currencies = [CurrencyInformation(cc: "AUD", rate: 20.9881), CurrencyInformation(cc: "CAD", rate: 21.9061)]
    var currentCurrency: CurrencyInformation?

    let backButton : UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Back"
        return button
    }()
    var currencyPicker = UIPickerView()
    var topCalculationRow = TopCalculationRowView()
    var bottomCalculationRow = BottomCalculationRowView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Converter"
        currentCurrency = currencies.first

        setupNavButton()
        setupPicker()
        setupTopCalculationRow()
        setupBottomCalculationRow()
    }

    func calculateTopCalculationRow(value: String?) {
        if let value = value,
           let current = currentCurrency,
           let doubleValue = Double(value) {
                let roundedResult = Double(round(doubleValue / current.rate * 100) / 100)
                topCalculationRow.currencyField.text = String(roundedResult)
        }
    }

    func calculateBottomCalculationRow(value: String?) {
        if let value = value,
           let current = currentCurrency,
           let doubleValue = Double(value) {
                let roundedResult = Double(round(doubleValue * current.rate * 100) / 100)
                bottomCalculationRow.currencyField.text = String(roundedResult)
        }
    }

    private func setupNavButton() {
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }

    private func setupPicker() {
        currencyPicker = UIPickerView(frame: CGRect(x: 0, y: 190, width: view.frame.width, height: 100))
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        view.addSubview(currencyPicker)
    }

    private func setupTopCalculationRow() {
        if let first = currencies.first {
            topCalculationRow.setupLabel(value: first.cc)
        }
        topCalculationRow.frame = CGRect(x: 0, y: 90, width: view.frame.width, height: 100)
        topCalculationRow.delegateController = self
        view.addSubview(topCalculationRow)
    }
    private func setupBottomCalculationRow() {
        bottomCalculationRow.frame = CGRect(x: 0, y: 290, width: view.frame.width, height: 100)
        bottomCalculationRow.delegateController = self
        view.addSubview(bottomCalculationRow)
    }
}

extension ConverterViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
}

extension ConverterViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row].cc
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentCurrency = currencies[row]
        topCalculationRow.setupLabel(value: currencies[row].cc)
    }
}
