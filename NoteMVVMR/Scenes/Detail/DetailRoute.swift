//
//  DetailRoute.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 8.02.2022.
//

protocol DetailRoute {
    func pushDetail()
}

extension DetailRoute where Self: RouterProtocol {
    
    func pushDetail() {
        let router = DetailRouter()
        let viewModel = DetailViewModel(router: router)
        let viewController = DetailViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}