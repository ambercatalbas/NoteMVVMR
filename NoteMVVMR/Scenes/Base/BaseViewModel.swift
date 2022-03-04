//
//  BaseViewModel.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

import Foundation
import DataProvider

protocol BaseViewModelDataSource: AnyObject {}

protocol BaseViewModelEventSource: AnyObject {
    var showActivityIndicatorView: VoidClosure? { get set }
    var hideActivityIndicatorView: VoidClosure? { get set }
    
    var showLoading: VoidClosure? { get set }
    var hideLoading: VoidClosure? { get set }
    
    var showSuccesWarningToast: StringClosure? { get set }
    var showFailureWarningToast: StringClosure? { get set }

}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {}

class BaseViewModel<R: Router>: BaseViewModelProtocol {
    
    var showSuccesWarningToast: StringClosure?
    var showFailureWarningToast: StringClosure?
    
    
    var showActivityIndicatorView: VoidClosure?
    var hideActivityIndicatorView: VoidClosure?
    
    var showLoading: VoidClosure?
    var hideLoading: VoidClosure?
    
    
    let router: R
    let dataProvider: DataProviderProtocol
  
  init(router: R, dataProvider: DataProviderProtocol = apiDataProvider) {
      self.router = router
      self.dataProvider = dataProvider
  }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
    
}
