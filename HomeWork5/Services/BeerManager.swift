//
//  BeerManager.swift
//  HomeWork5
//
//  Created by Екатерина Лаптева on 17.02.22.
//

import Foundation
import UIKit
import RealmSwift

class BeerManager {
    
    //MARK: - Properties
    
    let realm = try! Realm()
    lazy var currentBeers: Results<Beer> = {self.realm.objects(Beer.self)}()
    lazy var bank = {self.realm.objects(Bank.self)}().first!
    
    static public var manager = BeerManager()
    
    var beers = [Beer(mark: "Budweiser",
                              price: 8,
                              countryOfProduction: "USA",
                              theRestOfBeer: 56),
                        Beer(mark: "Heineken",
                              price: 5,
                              countryOfProduction: "Holland",
                              theRestOfBeer: 23),
                        Beer(mark: "Corona",
                              price: 7,
                              countryOfProduction: "Mexico",
                              theRestOfBeer: 8) ]
    
    private init() {
        if self.currentBeers.isEmpty {
            try! realm.write() {
                let bank = Bank()
                realm.add(bank)
                realm.add(beers)
                
                for beer in beers {
                    bank.beer.append(beer)
                }
            }
        }
    }
    
    //MARK: - Methods
    
    func buyBeer(mark: String) {
        guard let buyingBeer = currentBeers.filter({$0.mark == mark}).first else { return }
        if buyingBeer.theRestOfBeer > 0 {
            let price = buyingBeer.price
            try! realm.write {
                bank.money += price
                buyingBeer.theRestOfBeer -= 1
            }
        } else {
            print("OUT OF STOCK")
        }
    }
    
    func countMoney() -> Int {
        return bank.money
    }
    
    func startNewDay() {
        try! realm.write {
            bank.money = 0
        }
    }
}
