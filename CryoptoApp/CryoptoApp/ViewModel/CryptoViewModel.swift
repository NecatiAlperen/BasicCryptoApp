//
//  CryptoViewModel.swift
//  CryoptoApp
//
//  Created by Necati Alperen IŞIK on 28.10.2023.
//

import Foundation
import RxSwift
import RxCocoa

class CryptoViewModel {

    
    let cryptos : PublishSubject<[Crypto]> = PublishSubject()
    let error :PublishSubject<String> = PublishSubject()
    let loading :PublishSubject<Bool> = PublishSubject()

    func requestData(){
        self.loading.onNext(true)
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json")!
        Webservice().downloadCurrencies(url: url) { result in
            self.loading.onNext(false)
            switch result{
            case .success(let cryptos):
                self.cryptos.onNext(cryptos)
            case .failure(let error):
                switch error {
                case .parsingError:
                    self.error.onNext("parsing erros")
                case.serverError:
                    self.error.onNext("server error")
                }
                
            }
        }
    }
    
    
}
