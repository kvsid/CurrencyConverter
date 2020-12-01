//
//  ConverterViewController.swift
//  Converter
//
//  Created by Xenia Sidorova on 30.11.2020.
//

import UIKit

class ConverterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Converter"
//
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton

//        createCurrencyView()

//        let currencySelector = UIPickerView()
//        currencySelector.frame = CGRect(x: 0, y: 200, width: self.view.frame.width, height: 200)
//        view.addSubview(currencySelector)
//
//        let secondCurrencyView = UIView()
//        secondCurrencyView.frame = CGRect(x: 0, y: 400, width: self.view.frame.width, height: 100)
//        secondCurrencyView.backgroundColor = .systemYellow
//        view.addSubview(secondCurrencyView)

    }

//    func createCurrencyView() {
//        let currencyView = UIView()
//        currencyView.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: 100)
//        currencyView.backgroundColor = .systemYellow
//        view.addSubview(currencyView)
//
//        func createCurrencyField() {
//            let currencyField = UITextField()
////                currencyField.size
//            currencyView.addSubview(currencyField)
//        }
//    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//        self.perform(#selector(goBack), with: nil, afterDelay: 3.0)
 //   }
//
//    @objc func goBack() {
//        self.navigationController?.popViewController(animated: true)
//    }
}
