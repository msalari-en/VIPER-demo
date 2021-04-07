//
//  PreviewPresenter.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import Foundation

protocol PreviewPresenter {
  func present()
}

class PreviewPresenterImp: PreviewPresenter {

  weak var view: PreviewView!
  var interactor: PreviewInteractor!
  var router: PreviewRouter!

  init(view: PreviewView,
       interactor: PreviewInteractor,
       router: PreviewRouter) {

    self.view = view
    self.interactor = interactor
    self.router = router
  }

  func present() {
    view.prepare(with: PreviewViewModel(title: interactor.fruit.name,
                                        image: interactor.fruit.emoji.toEmoji(height: 256)))
  }
}
