//
//  SplashPresenter.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import Foundation

protocol SplashPresenter {
  func present()
}

class SplashPresenterImp: SplashPresenter {

  weak var view: SplashView!
  var interactor: SplashInteractor!
  var router: SplashRouter!

  init(view: SplashView,
       interactor: SplashInteractor,
       router: SplashRouter) {

    self.view = view
    self.interactor = interactor
    self.router = router
  }

  func present() {
    let title = String(describing: SplashView.self)
    let viewModel = SplashViewModel()
    viewModel.title = title

    view.prepare(with: viewModel)
  }
}
