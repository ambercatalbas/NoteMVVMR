//
//  BaseViewController.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

import UIKit

class BaseViewController<V: BaseViewModelProtocol>: UIViewController {
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appWhite
      
    }
    func showWarningToast(message: String, entryBackground: UIColor ) {
        ToastPresenter.showWarningToast(text: message, entryBackground: entryBackground)
    }
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
    
}
