//
//  Webservice.swift
//  CryoptoApp
//
//  Created by Necati Alperen IŞIK on 28.10.2023.
//

import Foundation
enum CryptoError : Error {
    case serverError
    case parsingError
}


class Webservice {
    
    func downloadCurrencies(url: URL, completion: @escaping(Result<[Crypto],CryptoError>) -> () ){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.serverError))
            }else if let data = data{
               let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                if let cryptoList = cryptoList{
                    completion(.success(cryptoList))
                }else{
                    completion(.failure(.parsingError))
                }
            }
            
        }.resume()
        
    }
}
