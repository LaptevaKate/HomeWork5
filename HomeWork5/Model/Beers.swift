//
//  Beers.swift
//  HomeWork5
//
//  Created by Екатерина Лаптева on 17.02.22.
//

import UIKit

class Beers {
    let mark: String
    let price: Int
    let countryOfProduction: String
    var theRestOfBeer: Int
    
    init(mark: String, price: Int, countryOfProduction: String, theRestOfBeer: Int) {
    self.mark = mark
    self.price = price
    self.countryOfProduction = countryOfProduction
    self.theRestOfBeer = theRestOfBeer
        
    }
}
