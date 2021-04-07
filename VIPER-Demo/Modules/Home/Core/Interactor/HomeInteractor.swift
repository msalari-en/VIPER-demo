//
//  HomeInteractor.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit

protocol HomeInteractor {
    
    func getFruits() -> [Fruit]
    
    init(with dataService: DataServiceProtocol)
}

class HomeInteractorImp: HomeInteractor {
    
    private let dataService: DataServiceProtocol
    
    required init(with dataService: DataServiceProtocol) {
        self.dataService = dataService
    }
    
    func getFruits() -> [Fruit] {
        return dataService.getFruits()
    }
}
