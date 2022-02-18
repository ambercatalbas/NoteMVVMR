//
//  HomeRoute.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 7.02.2022.
//

protocol HomeRoute {
    func pushHome()
    func modalHome()
}

extension HomeRoute where Self: RouterProtocol {
    
    func pushHome() {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router)
        let viewController = HomeViewController(viewModel: viewModel)
        let navController = MainNavigationController(rootViewController: viewController)
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navController, transition: transition)
    }
    func modalHome() {
        let router = HomeRouter()
        let viewModel = HomeViewModel(router: router)
        let viewController = HomeViewController(viewModel: viewModel)
       
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
