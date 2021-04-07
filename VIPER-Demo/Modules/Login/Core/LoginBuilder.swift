//
//  LoginBuilder.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit
import Swinject

protocol LoginBuilder {
  func buildLoginViewController() -> LoginViewController!
}

class LoginDefaultBuilder: LoginBuilder {
  let container = Container()

  func buildLoginViewController() -> LoginViewController! {

    container.register(LoginInteractor.self) { _ in // rename parameter to container
      LoginInteractorImp() //Add service
    }

    container.register(LoginViewController.self) { _ in

      LoginViewController(nibName: String(describing: LoginViewController.self),
                                                           bundle: .main)

    }.initCompleted { r, h in

      h.presenter = r.resolve(LoginPresenter.self)
    }

    container.register(LoginRouter.self) { c in
      let router = LoginRouterImp()
      router.viewController = c.resolve(LoginViewController.self)!
      return router
    }

    container.register(LoginPresenter.self) { c in
      LoginPresenterImp(view: c.resolve(LoginViewController.self)!,
        interactor: c.resolve(LoginInteractor.self)!,
        router: c.resolve(LoginRouter.self)!)
    }

    return container.resolve(LoginViewController.self)!
  }

  deinit {
    container.removeAll()
  }
}
