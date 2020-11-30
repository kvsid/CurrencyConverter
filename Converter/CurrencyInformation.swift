//
//  CurrencyInformation.swift
//  Converter
//
//  Created by Xenia Sidorova on 30.11.2020.
//

import Foundation
import UIKit

struct CurrencyInformation: Codable {
    var cc : String
    var rate : Double
}

struct CurrencyInformationResponse: Decodable {
    var array: CurrencyInformation

    init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
//        self.array = try container.decode([CurrencyInformation].self)
        self.array = try! container.decode(CurrencyInformation.self)
    }
}

class CurrencyAPIService {
    let urlString = "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json"
    //[{"r030":36,"txt":"Австралійський долар","rate":20.9881,"cc":"AUD","exchangedate":"30.11.2020"}]

    func loadCurrency() -> Void { // -> [CurrencyInformation]
        self.loadJson(fromURLString: urlString) { (result) in
            switch result {
            case .success(let data):
                print(
                    self.parse(jsonData: data)
                )
            case .failure(let error):
                print(error)
            }
        }
    }

    private func loadJson(fromURLString urlString: String,
                      completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    completion(.success(data))
                }
            }
        urlSession.resume()
        }
    }

    private func parse(jsonData: Data) {

       do {
           let decodedData = try JSONDecoder().decode(CurrencyInformationResponse.self,
                                                      from: jsonData)
            print(decodedData)
//           print("CC: ", decodedData.cc)
//           print("Rate: ", decodedData.rate)
           print("===================================")
       } catch {
           print("decode error")
       }
   }
}
