//
//  DetailRoute.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 8.02.2022.
//

protocol DetailRoute {
    
    func pushDetail(note: Note, type: DetailVCShowType)
}

extension DetailRoute where Self: RouterProtocol {
    
    func pushDetail(note: Note, type: DetailVCShowType) {
        let router = DetailRouter()
        let viewModel = DetailViewModel(note: note, type: type, router: router)
        let viewController = DetailViewController(viewModel: viewModel)
        let transition = PushTransition()
        router.viewController = viewController
        router.openTransition = transition
        
        open(viewController, transition: transition)
    }

}
