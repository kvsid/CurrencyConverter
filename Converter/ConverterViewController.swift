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

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Converter"
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

        let currencySelector = UIPickerView(frame: CGRect(x: 0, y: 200, width: view.frame.width, height: 200))
        currencySelector.center = view.center
        currencySelector.dataSource = self
        currencySelector.delegate = self
        view.addSubview(currencySelector)
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
        print("row \(row). component \(component)")
    }
}
