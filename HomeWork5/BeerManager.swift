//
//  BeerManager.swift
//  HomeWork5
//
//  Created by Екатерина Лаптева on 17.02.22.
//

import Foundation
import UIKit

class BeerManager {
    
    static public var manager = BeerManager()
    var money: Int
    
    public var beers = [Beers(mark: "Budweiser", price: 8, countryOfProduction: "USA", theRestOfBeer: 56), Beers(mark: "Heineken", price: 5, countryOfProduction: "Holland", theRestOfBeer: 23), Beers(mark: "Corona", price: 7, countryOfProduction: "Mexico", theRestOfBeer: 8) ]
    
    private init() {
        self.money = 0
    }
    
    func buyBeer(mark: String) {
        guard let buyingBeer = beers.filter({$0.mark == mark}).first else { return }
        if buyingBeer.theRestOfBeer > 0 {
            let price = buyingBeer.price
            money += price
            buyingBeer.theRestOfBeer -= 1
        } else {
           print("OUT OF STOCK")
        }
    }
    
    func countMoney() -> Int {
        money
    }
    
    func startNewDay() {
        money = 0
    }
}
