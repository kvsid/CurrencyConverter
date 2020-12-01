//
//  ViewController.swift
//  Converter
//
//  Created by Xenia Sidorova on 30.11.2020.
//

import UIKit

class CurrencyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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

    var displayConverterButton = UIButton()
    var currencyTable = UITableView()
    var currencies = [CurrencyInformation(cc: "AUD", rate: 20.9881), CurrencyInformation(cc: "CAD", rate: 21.9061)]

    override func viewDidLoad() {
        super.viewDidLoad()

        createTable()

        self.title = "Currency"

        self.displayConverterButton = UIButton(type: .system)
        self.displayConverterButton.setTitle("Converter", for: .normal)

        self.displayConverterButton.sizeToFit()
        self.displayConverterButton.backgroundColor = .systemYellow
        self.displayConverterButton.tintColor = .black
        self.displayConverterButton.frame = CGRect(x: 0, y: self.view.frame.height - 100, width: self.view.frame.width, height: 100)


        self.displayConverterButton.addTarget(self, action: #selector(performDisplayConverter(parametrSender:)), for: .touchUpInside)
        self.view.addSubview(self.displayConverterButton)
    }

    @objc func performDisplayConverter (parametrSender: Any) {
        let converter = ConverterViewController()
        self.navigationController?.pushViewController(converter, animated: true)
    }

    func createTable() {
        self.currencyTable = UITableView(frame: view.bounds, style: .plain)
        self.currencyTable.delegate = self
        self.currencyTable.dataSource = self

        self.currencyTable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.currencyTable.register(Cell.self, forCellReuseIdentifier: "Cell")

        view.addSubview(currencyTable)
    }

}

class Cell: UITableViewCell {
    var currencySign: UILabel = {
        var sign = UILabel(frame: CGRect(x: 20.0, y: 15.0, width: 300.0, height: 30))
        return sign
    }()
    var currencyRate: UILabel = {
        var rate = UILabel(frame: CGRect(x: 300.0, y: 15.0, width: 300.0, height: 30))
        return rate
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(currencySign)
        self.addSubview(currencyRate)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
