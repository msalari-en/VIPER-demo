//
//  PreviewInteractor.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit

protocol PreviewInteractor {
    var fruit: Fruit { get }
}

class PreviewInteractorImp: PreviewInteractor {

    var fruit: Fruit
    
    init(with fruit: Fruit) {
        self.fruit = fruit
    }
}
