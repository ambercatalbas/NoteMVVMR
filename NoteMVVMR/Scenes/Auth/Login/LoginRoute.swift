//
//  LoginRoute.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 1.02.2022.
//

protocol LoginRoute {
    func pushLogin()
}

extension LoginRoute where Self: RouterProtocol {
    
    func pushLogin() {
        let router = LoginRouter()
        let viewModel = LoginViewModel(router: router)
        let viewController = LoginViewController(viewModel: viewModel)
        
        let navController = MainNavigationController(rootViewController: viewController)
        let transition = PlaceOnWindowTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(navController, transition: transition)
    }
}
