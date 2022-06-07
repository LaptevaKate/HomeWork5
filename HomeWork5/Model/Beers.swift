//
//  Beers.swift
//  HomeWork5
//
//  Created by Екатерина Лаптева on 17.02.22.
//

import UIKit
import RealmSwift

class Bank: Object {
    @Persisted var money: Int = 0
}

class Beer: Object {
    @Persisted var mark: String = ""
    @Persisted var price: Int = 0
    @Persisted var countryOfProduction: String = ""
    @Persisted var theRestOfBeer: Int = 0
    
    convenience init(mark: String, price: Int, countryOfProduction: String, theRestOfBeer: Int) {
        self.init()
        self.mark = mark
        self.price = price
        self.countryOfProduction = countryOfProduction
        self.theRestOfBeer = theRestOfBeer
    }
}
