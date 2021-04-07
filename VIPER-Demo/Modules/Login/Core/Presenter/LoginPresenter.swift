//
//  LoginPresenter.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import Foundation

protocol LoginPresenter {
  func present()
    func onLoginTapped()
}

class LoginPresenterImp: LoginPresenter {

  weak var view: LoginView!
  var interactor: LoginInteractor!
  var router: LoginRouter!

  init(view: LoginView,
       interactor: LoginInteractor,
       router: LoginRouter) {

    self.view = view
    self.interactor = interactor
    self.router = router
  }

  func present() {
    let title = String(describing: LoginView.self)
    let viewModel = LoginViewModel()
    viewModel.title = title

    view.prepare(with: viewModel)
  }
    
    func onLoginTapped() {
        router.navigateToHomeViewController()
    }
}
