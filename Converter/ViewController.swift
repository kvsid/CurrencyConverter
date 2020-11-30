//
//  ViewController.swift
//  Converter
//
//  Created by Xenia Sidorova on 30.11.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.textLabel?.text = currencies[indexPath.row].cc
        return cell
    }

    var displayConverterButton = UIButton()
    var currencyTable = UITableView()
    var currencies = [CurrencyInformation(cc: "AUD", rate: 20.9881), CurrencyInformation(cc: "CAD", rate: 21.9061)]


    class Cell: UITableViewCell {
    }

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
//        self.currencyTable.separatorStyle = .none
        self.currencyTable.delegate = self
        self.currencyTable.dataSource = self

        self.currencyTable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.currencyTable.register(Cell.self, forCellReuseIdentifier: "Cell")

        view.addSubview(currencyTable)
    }

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
}
