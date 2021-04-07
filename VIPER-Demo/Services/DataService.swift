//
//  DataService.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07.04.2021.
//

import UIKit

protocol DataServiceProtocol {
    func getFruits() -> [Fruit]
}

class DefaultDataService: DataServiceProtocol {
    
    func getFruits() -> [Fruit] {
        return [Fruit(name: "Apple", emoji: "🍏"),
                Fruit(name: "Banana", emoji: "🍌"),
                Fruit(name: "Pear", emoji: "🍐"),
                Fruit(name: "Lemon", emoji: "🍋")]
    }
}

class MyManager {
    let dataService: DataServiceProtocol
    let fruit: Fruit
    
    init(with fruit: Fruit) {
        self.fruit = fruit
        dataService = DefaultDataService()
    }
}
