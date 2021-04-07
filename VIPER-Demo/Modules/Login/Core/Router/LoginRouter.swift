//
//  LoginRouter.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit

protocol LoginRouter {
    func navigateToHomeViewController()
}

class LoginRouterImp: LoginRouter {
  weak var viewController: LoginViewController!
    
    func navigateToHomeViewController() {
        let controller = HomeDefaultBuilder().buildHomeViewController()!
        let navigation = UINavigationController(rootViewController: controller)
        navigation.modalPresentationStyle = .fullScreen
        viewController.present(navigation, animated: true)
    }
}
