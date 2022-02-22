//
//  PasswordResetRouter.swift
//  NoteListMVVM
//
//  Created by AMBER ÇATALBAŞ on 2.02.2022.
//

final class PasswordResetRouter: Router, PasswordResetRouter.Routes {
 
    typealias Routes = LoginRoute & RegisterRoute & PasswordResetMessageRoute
}
