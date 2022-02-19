//
//  PasswordResetMessageViewModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 20.02.2022.
//

import Foundation

protocol PasswordResetMessageViewDataSource {}

protocol PasswordResetMessageViewEventSource {}

protocol PasswordResetMessageViewProtocol: PasswordResetMessageViewDataSource, PasswordResetMessageViewEventSource {}

final class PasswordResetMessageViewModel: BaseViewModel<PasswordResetMessageRouter>, PasswordResetMessageViewProtocol {
    
}
