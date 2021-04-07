//
//  PreviewBuilder.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit
import Swinject

protocol PreviewBuilder {
    func buildPreviewViewController(with fruit: Fruit) -> PreviewViewController!
}

class PreviewDefaultBuilder: PreviewBuilder {
  let container = Container()

  func buildPreviewViewController(with fruit: Fruit) -> PreviewViewController! {

    container.register(PreviewInteractor.self) { _ in // rename parameter to container
      return PreviewInteractorImp(with: fruit) //Add service
    }

    container.register(PreviewViewController.self) { _ in

      PreviewViewController(nibName: String(describing: PreviewViewController.self),
                                                           bundle: .main)

    }.initCompleted { r, h in

      h.presenter = r.resolve(PreviewPresenter.self)
    }

    container.register(PreviewRouter.self) { c in
      let router = PreviewRouterImp()
      router.viewController = c.resolve(PreviewViewController.self)!
      return router
    }

    container.register(PreviewPresenter.self) { c in
      PreviewPresenterImp(view: c.resolve(PreviewViewController.self)!,
        interactor: c.resolve(PreviewInteractor.self)!,
        router: c.resolve(PreviewRouter.self)!)
    }

    return container.resolve(PreviewViewController.self)!
  }

  deinit {
    container.removeAll()
  }
}
