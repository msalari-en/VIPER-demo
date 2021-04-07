//
//  SplashBuilder.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit
import Swinject

protocol SplashBuilder {
  func buildSplashViewController() -> SplashViewController!
}

class SplashDefaultBuilder: SplashBuilder {
  let container = Container()

  func buildSplashViewController() -> SplashViewController! {

    container.register(SplashInteractor.self) { _ in // rename parameter to container
      SplashInteractorImp() //Add service
    }

    container.register(SplashViewController.self) { _ in

      SplashViewController(nibName: String(describing: SplashViewController.self),
                                                           bundle: .main)

    }.initCompleted { r, h in

      h.presenter = r.resolve(SplashPresenter.self)
    }

    container.register(SplashRouter.self) { c in
      let router = SplashRouterImp()
      router.viewController = c.resolve(SplashViewController.self)!
      return router
    }

    container.register(SplashPresenter.self) { c in
      SplashPresenterImp(view: c.resolve(SplashViewController.self)!,
        interactor: c.resolve(SplashInteractor.self)!,
        router: c.resolve(SplashRouter.self)!)
    }

    return container.resolve(SplashViewController.self)!
  }

  deinit {
    container.removeAll()
  }
}
