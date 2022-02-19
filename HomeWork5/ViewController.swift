//
//  ViewController.swift
//  HomeWork5
//
//  Created by Екатерина Лаптева on 17.02.22.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Properties
    
    private let beerManager = BeerManager.manager
    
    //MARK: - IBOutlets
    
    @IBOutlet private weak var counterLabel: UILabel!
    
    //MARK: - IBActions
    @IBAction private func budweiserSale(_ sender: Any) {
        beerManager.buyBeer(mark: "Budweiser")
        changeCounterLabel(beerManager.countMoney())
    }
    
    @IBAction private func heinekenSale(_ sender: Any) {
        beerManager.buyBeer(mark: "Heineken")
        changeCounterLabel(beerManager.countMoney())
    }
    
    @IBAction private func coronaSale(_ sender: Any) {
        beerManager.buyBeer(mark: "Corona")
        changeCounterLabel(beerManager.countMoney())
    }
    
    @IBAction private func startNewDay(_ sender: Any) {
        beerManager.startNewDay()
        changeCounterLabel(beerManager.countMoney())
    }
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.layer.cornerRadius = 10
        counterLabel.layer.masksToBounds = true
        changeCounterLabel(beerManager.money)
    }
    
    //MARK: - Methods
    private func changeCounterLabel(_ number: Int) {
        counterLabel.text = "My\nprofit\n\(number)$"
    }
}

