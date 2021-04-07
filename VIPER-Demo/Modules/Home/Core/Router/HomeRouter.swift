//
//  HomeRouter.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit

protocol HomeRouter {
    func navigateToPreviewController(with fruit: Fruit)
}

class HomeRouterImp: HomeRouter {
    weak var viewController: HomeViewController!
    
    func navigateToPreviewController(with fruit: Fruit) {
        let controller = PreviewDefaultBuilder().buildPreviewViewController(with: fruit)!
        viewController.navigationController?.pushViewController(controller, animated: true)
    }
}
