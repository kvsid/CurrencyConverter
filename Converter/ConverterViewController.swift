//
//  ConverterViewController.swift
//  Converter
//
//  Created by Xenia Sidorova on 30.11.2020.
//

import UIKit

class ConverterViewController: UIViewController {
    var currencies = [CurrencyInformation(cc: "AUD", rate: 20.9881), CurrencyInformation(cc: "CAD", rate: 21.9061)]

    let backButton : UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Back"
        return button
    }()
    let topCalculationRow = CalculationRowView()
    let bottomCalculationRow = CalculationRowView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Converter"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        let currencySelector = UIPickerView(frame: CGRect(x: 0, y: 190, width: view.frame.width, height: 100))
        currencySelector.dataSource = self
        currencySelector.delegate = self

        topCalculationRow.frame = CGRect(x: 0, y: 90, width: view.frame.width, height: 100)
        bottomCalculationRow.frame = CGRect(x: 0, y: 290, width: view.frame.width, height: 100)

        view.addSubview(currencySelector)
        view.addSubview(topCalculationRow)
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
        topCalculationRow.setupCurrencyLabel(currencies[row].cc)
    }
}
