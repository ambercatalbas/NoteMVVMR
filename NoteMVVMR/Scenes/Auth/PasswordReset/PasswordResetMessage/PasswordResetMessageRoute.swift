//
//  PasswordResetMessageRoute.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 20.02.2022.
//

protocol PasswordResetMessageRoute {
    func presentPasswordResetMessage()
}

extension PasswordResetMessageRoute where Self: RouterProtocol {
    
    func presentPasswordResetMessage() {
        let router = PasswordResetMessageRouter()
        let viewModel = PasswordResetMessageViewModel(router: router)
        let viewController = PasswordResetMessageViewController(viewModel: viewModel)
        
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
