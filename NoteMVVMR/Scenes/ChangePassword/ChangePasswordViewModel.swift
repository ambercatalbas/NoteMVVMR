//
//  ChangePasswordViewModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 18.02.2022.
//

import Foundation

protocol ChangePasswordViewDataSource {}

protocol ChangePasswordViewEventSource {}

protocol ChangePasswordViewProtocol: ChangePasswordViewDataSource, ChangePasswordViewEventSource {}

final class ChangePasswordViewModel: BaseViewModel<ChangePasswordRouter>, ChangePasswordViewProtocol {
    
}
