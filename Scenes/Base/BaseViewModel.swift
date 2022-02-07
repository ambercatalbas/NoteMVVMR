//
//  BaseViewModel.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

import Foundation

protocol BaseViewModelDataSource: AnyObject {}

protocol BaseViewModelEventSource: AnyObject {
    var showActivityIndicatorView: VoidClosure? { get set }
    var hideActivityIndicatorView: VoidClosure? { get set }
    
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
    
    var showWarningToast: StringClosure? { get set }
}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    var showActivityIndicatorView: VoidClosure?
    var hideActivityIndicatorView: VoidClosure?
    
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
    
    var showWarningToast: StringClosure?
    
    let router: R
    
    init(router: R) {
        self.router = router
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
    
}
