//
//  HomeConfigurator.swift
//  Xumak Test
//
//  Created by Erick Pac on 27/01/21.
//

struct HomeConfigurator {
    
    static func getController() -> HomeViewController {
        let viewController = HomeViewController.loadFromStoryboard()
        viewController.presenter = HomePresenterImpl()
        viewController.presenter.view = viewController
        let router = HomeRouterImpl(viewController: viewController)
        viewController.presenter.router = router
        return viewController
    }
    
}
