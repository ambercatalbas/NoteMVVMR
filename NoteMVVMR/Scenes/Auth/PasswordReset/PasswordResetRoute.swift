//
//  PasswordResetRoute.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

protocol PasswordResetRoute {
    
    func pushPasswordReset()
}

extension PasswordResetRoute where Self: RouterProtocol {
    
    func pushPasswordReset() {
        let router = PasswordResetRouter()
        let viewModel = PasswordResetViewModel(router: router)
        let viewController = PasswordResetViewController(viewModel: viewModel)
        
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
    
    func modalPasswordReset(isBackScrenLogin: Bool) {
        let router = PasswordResetRouter()
        let viewModel = PasswordResetViewModel(router: router)
        let viewController = PasswordResetViewController(viewModel: viewModel)
        viewController.isBackScrenLogin = isBackScrenLogin
        let transition = ModalTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
