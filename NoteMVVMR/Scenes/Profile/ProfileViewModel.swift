//
//  ProfileViewModel.swift
//  NoteMVVMR
//
//  Created by AMBER ÇATALBAŞ on 17.02.2022.
//

import Foundation
import KeychainSwift

protocol ProfileViewDataSource {
    
    func getUser() -> User
}

protocol ProfileViewEventSource {
    var didSuccessFetchUser: VoidClosure? { get set }
    
}

protocol ProfileViewProtocol: ProfileViewDataSource, ProfileViewEventSource {
    
    func showHomeScreen()
    func updateUser(userName: String, email: String)
    func getUserRequest()
    func pushChangePasswordScene()
    func signOut()
}

final class ProfileViewModel: BaseViewModel<ProfileRouter>, ProfileViewProtocol {
    
    var user: User = User(id: 0, userName: "", email: "")
    var didSuccessFetchUser: VoidClosure?
    var keychain = KeychainSwift()
    func getUser() -> User {
        return user
    }
    
    func showHomeScreen() {
        router.close()
    }
    
    func pushChangePasswordScene() {
        router.pushChangePassword()
    }
    
    func signOut() {
        keychain.clear()
        router.placeOnWindowLogin()
    }
    
}

extension ProfileViewModel {
    
    func updateUser(userName: String, email: String) {
        dataProvider.request(for: UpdateUserRequest(userName: userName, email: email)) { [weak self] (result) in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                self?.showSuccesWarningToast?("\(Strings.Success.succesUpdeteProfile)")
            case .failure(let error):
                self?.showFailureWarningToast?("\(error.localizedDescription)")
            }
        }
    }
    
    func getUserRequest() {
        dataProvider.request(for: GetUserRequest()) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.user = response.data ?? User(id: 0, userName: "", email: "")
                self.didSuccessFetchUser?()
            case .failure(let error):
                self.showFailureWarningToast?("\(error.localizedDescription)")
            }
        }
    }
}
