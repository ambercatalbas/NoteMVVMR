//
//  ProfileViewModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 17.02.2022.
//

import Foundation

protocol ProfileViewDataSource {}

protocol ProfileViewEventSource {}

protocol ProfileViewProtocol: ProfileViewDataSource, ProfileViewEventSource {
    func showHomeScreen()
    func updateUser()
    func pushChangePasswordScene()
    func signOut()
}

final class ProfileViewModel: BaseViewModel<ProfileRouter>, ProfileViewProtocol {
    func showHomeScreen() {
        router.close()
    }
    
    func updateUser() {
//        request
        print("update user")
    }
    
    func pushChangePasswordScene() {
        router.pushChangePassword()
    }
    
    func signOut() {
//        clear keychain
        print("signout")
//        router.modalLogin()
    }
    

}
