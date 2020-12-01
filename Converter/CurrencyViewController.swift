//
//  ViewController.swift
//  Converter
//
//  Created by Xenia Sidorova on 30.11.2020.
//

import UIKit

class CurrencyViewController: UIViewController, UITableViewDataSource {
    var displayConverterButton = UIButton()
    var currencyTable = UITableView()
    var currencies = [CurrencyInformation(cc: "AUD", rate: 20.9881), CurrencyInformation(cc: "CAD", rate: 21.9061)]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Currency"
        setupTable()
        setupButton()
    }

    @objc func performDisplayConverter (parametrSender: Any) {
        let converter = ConverterViewController()
        self.navigationController?.pushViewController(converter, animated: true)
    }

    func setupButton(){
        displayConverterButton = UIButton(type: .system)
        displayConverterButton.setTitle("Converter", for: .normal)
        displayConverterButton.sizeToFit()
        displayConverterButton.backgroundColor = .systemYellow
        displayConverterButton.tintColor = .black
        displayConverterButton
            .frame = CGRect(x: 0, y: self.view.frame.height - 100, width: self.view.frame.width, height: 100)


        displayConverterButton
            .addTarget(self, action: #selector(performDisplayConverter(parametrSender:)), for: .touchUpInside)
        view.addSubview(self.displayConverterButton)
    }

    func setupTable() {
        currencyTable = UITableView(frame: view.bounds, style: .plain)
        currencyTable.delegate = self
        currencyTable.dataSource = self
        currencyTable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        currencyTable.register(Cell.self, forCellReuseIdentifier: "Cell")

        view.addSubview(currencyTable)
    }

}

extension CurrencyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let currentCurrency = currencies[indexPath.row]
        cell.currencySign.text = currentCurrency.cc
        cell.currencyRate.text = String(currentCurrency.rate)
        return cell
    }
}
