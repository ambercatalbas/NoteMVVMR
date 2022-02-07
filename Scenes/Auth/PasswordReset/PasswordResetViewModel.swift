//
//  PasswordResetViewModel.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

import Foundation

protocol PasswordResetViewDataSource {}

protocol PasswordResetViewEventSource {}

protocol PasswordResetViewProtocol: PasswordResetViewDataSource, PasswordResetViewEventSource {}

final class PasswordResetViewModel: BaseViewModel<PasswordResetRouter>, PasswordResetViewProtocol {
    
}
