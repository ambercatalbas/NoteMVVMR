//
//  DetailRoute.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 8.02.2022.
//

protocol DetailRoute {
    func pushDetail(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType)
    func pushEdit(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType)
    func pushAdd(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType)
}

extension DetailRoute where Self: RouterProtocol {
    func pushDetail(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType) {
        let router = DetailRouter()
        let viewModel = DetailViewModel(router: router)
        let viewController = DetailViewController(viewModel: viewModel)
        viewController.set(titleText: titleText, descriptionText: descriptionText, noteId: noteId, type: type)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }

    func pushEdit(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType) {
        let router = DetailRouter()
        let viewModel = DetailViewModel(router: router)
        let viewController = DetailViewController(viewModel: viewModel)
        viewController.set(titleText: titleText, descriptionText: descriptionText, noteId: noteId, type: type)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
    func pushAdd(titleText: String, descriptionText: String, noteId: Int, type: DetailVCShowType) {
        let router = DetailRouter()
        let viewModel = DetailViewModel(router: router)
        let viewController = DetailViewController(viewModel: viewModel)
        viewController.set(titleText: titleText, descriptionText: descriptionText, noteId: noteId, type: type)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }
}
