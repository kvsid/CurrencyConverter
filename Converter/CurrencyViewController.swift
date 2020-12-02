//
//  ViewController.swift
//  Converter
//
//  Created by Xenia Sidorova on 30.11.2020.
//

import UIKit

class CurrencyViewController: UIViewController, UITableViewDataSource {
    private let converter = ConverterViewController()
    private var displayConverterButton = UIButton()
    private var currencyTable = UITableView()
    private var currencies = [CurrencyInformation]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Currency"
        setupTable()
        setupButton()
        requestCurrencies()
    }

    @objc func performDisplayConverter (parametrSender: Any) {
        converter.currencies = currencies
        navigationController?.pushViewController(converter, animated: true)
    }

    private func setupButton(){
        displayConverterButton = UIButton(type: .system)
        displayConverterButton.setTitle("Converter", for: .normal)
        displayConverterButton.sizeToFit()
        displayConverterButton.backgroundColor = .systemYellow
        displayConverterButton.tintColor = .black
        displayConverterButton
            .frame = CGRect(x: 0, y: view.frame.height - 100, width: view.frame.width, height: 100)
        displayConverterButton
            .addTarget(self, action: #selector(performDisplayConverter(parametrSender:)), for: .touchUpInside)

        view.addSubview(displayConverterButton)
    }

    private func setupTable() {
        currencyTable = UITableView(frame: view.bounds, style: .plain)
        currencyTable.delegate = self
        currencyTable.dataSource = self
        currencyTable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        currencyTable.register(Cell.self, forCellReuseIdentifier: "Cell")

        view.addSubview(currencyTable)
    }

    private func requestCurrencies() {
        let url = URL(string: "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil, response != nil else {
                print("Something went wrong. The data nil")
                return
            }
            do {
                let decodedData = try JSONDecoder().decode([CurrencyInformation].self, from: data)
                self.currencies = decodedData
                DispatchQueue.main.async {
                    self.currencyTable.reloadData()
                }
            } catch {
                print("Something went wrong")
            }
        }.resume()
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
