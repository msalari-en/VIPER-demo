//
//  HomePresenter.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import Foundation

protocol HomePresenter {
    func present()
    func didSelect(viewModel: HomeViewModel)
}

class HomePresenterImp: HomePresenter {
    
    weak var view: HomeView!
    var interactor: HomeInteractor!
    var router: HomeRouter!
    
    init(view: HomeView,
         interactor: HomeInteractor,
         router: HomeRouter) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func present() {
        let fruits = interactor.getFruits()
        let viewModels = fruits.compactMap { HomeViewModel(with: $0) }
        view.prepare(with: viewModels)
    }
    
    func didSelect(viewModel: HomeViewModel) {
        router.navigateToPreviewController(with: viewModel.fruit)
    }
}
