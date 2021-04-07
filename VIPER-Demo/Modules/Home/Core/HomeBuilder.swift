//
//  HomeBuilder.swift
//  VIPER-Demo
//
//  Created by Mihail Salari on 07/04/2021.
//  Copyright © 2021 ICS Endava SRL. All rights reserved.
//

import UIKit
import Swinject

protocol HomeBuilder {
    func buildHomeViewController() -> HomeViewController!
}

class HomeDefaultBuilder: HomeBuilder {
    
    let container = Container(parent: ApplicationContext.defaultContainer)
    
    func buildHomeViewController() -> HomeViewController! {
        
        container.register(HomeInteractor.self) { container in // rename parameter to resolver
            let dataService: DataServiceProtocol = container.resolve(DataServiceProtocol.self)!
            return HomeInteractorImp(with: dataService) //Add service
        }
        
        container.register(HomeViewController.self) { _ in
            
            HomeViewController(nibName: String(describing: HomeViewController.self),
                               bundle: .main)
            
        }.initCompleted { r, h in
            
            h.presenter = r.resolve(HomePresenter.self)
        }
        
        container.register(HomeRouter.self) { c in
            let router = HomeRouterImp()
            router.viewController = c.resolve(HomeViewController.self)!
            return router
        }
        
        container.register(HomePresenter.self) { c in
            HomePresenterImp(view: c.resolve(HomeViewController.self)!,
                             interactor: c.resolve(HomeInteractor.self)!,
                             router: c.resolve(HomeRouter.self)!)
        }
        
        return container.resolve(HomeViewController.self)!
    }
    
    deinit {
        container.removeAll()
    }
}
