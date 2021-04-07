//
//  SplashViewController.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit

class SplashViewModel {
  var title: String?
}

protocol SplashView: class {
  func prepare(with viewModel: SplashViewModel)
}

class SplashViewController: UIViewController, SplashView {
  var presenter: SplashPresenter!

  override func viewDidLoad() {
    super.viewDidLoad()

    presenter.present()
  }

  func prepare(with viewModel: SplashViewModel) {
    self.title = viewModel.title
  }
}
