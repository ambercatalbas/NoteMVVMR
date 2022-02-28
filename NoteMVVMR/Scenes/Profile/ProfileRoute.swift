//
//  ProfileRoute.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 17.02.2022.
//

protocol ProfileRoute {
    
    func pushProfile()
    func modalProfile()
}

extension ProfileRoute where Self: RouterProtocol {
    
    func pushProfile() {
        let router = ProfileRouter()
        let viewModel = ProfileViewModel(router: router)
        let viewController = ProfileViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
    
    func modalProfile() {
        let router = ProfileRouter()
        let viewModel = ProfileViewModel(router: router)
        let viewController = ProfileViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
