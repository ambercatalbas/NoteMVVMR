//
//  PasswordResetMessageRoute.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 20.02.2022.
//

protocol PasswordResetMessageRoute {
    
    func presentPasswordResetMessage(email: String)
}

extension PasswordResetMessageRoute where Self: RouterProtocol {
    
    func presentPasswordResetMessage(email: String) {
        let router = PasswordResetMessageRouter()
        let viewModel = PasswordResetMessageViewModel(router: router)
        let viewController = PasswordResetMessageViewController(viewModel: viewModel)
        viewController.email = email
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
