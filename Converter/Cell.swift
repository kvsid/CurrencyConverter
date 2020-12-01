//
//  Cell.swift
//  Converter
//
//  Created by Xenia Sidorova on 01.12.2020.
//

import UIKit

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
