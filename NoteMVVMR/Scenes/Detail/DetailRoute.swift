//
//  DetailRoute.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 8.02.2022.
//

protocol DetailRoute {
    func pushDetail(titleText: String, descriptionText: String, noteId: Int)
    func pushEdit(titleText: String, descriptionText: String, noteId: Int)
    func pushAdd()
}

extension DetailRoute where Self: RouterProtocol {
    
    func pushDetail(titleText: String, descriptionText: String, noteId: Int) {
        let router = DetailRouter()
        let viewModel = DetailViewModel(router: router)
        let viewController = DetailViewController(viewModel: viewModel)
        viewController.set(titleText: titleText, descriptionText: descriptionText, noteId: noteId)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
    func pushEdit(titleText: String, descriptionText: String, noteId: Int) {
        let router = DetailRouter()
        let viewModel = DetailViewModel(router: router)
        let viewController = DetailViewController(viewModel: viewModel)
        viewController.set(titleText: titleText, descriptionText: descriptionText, noteId: noteId)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
    func pushAdd() {
        let router = DetailRouter()
        let viewModel = DetailViewModel(router: router)
        let viewController = DetailViewController(viewModel: viewModel)
       
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
