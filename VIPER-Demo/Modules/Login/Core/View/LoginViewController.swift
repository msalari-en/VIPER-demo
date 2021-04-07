//
//  LoginViewController.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit

class LoginViewModel {
    var title: String?
}

protocol LoginView: class {
    func prepare(with viewModel: LoginViewModel)
}

class LoginViewController: UIViewController, LoginView {
    var presenter: LoginPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.present()
    }
    
    func prepare(with viewModel: LoginViewModel) {
        self.title = viewModel.title
    }
    
    @IBAction private func onLoginTapped(_ sender: UIButton) {
        presenter.onLoginTapped()
    }
}
