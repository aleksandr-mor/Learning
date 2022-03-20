//
//  ViewModel.swift
//  MVVMSimple
//
//  Created by Aleksandr Morozov on 20.03.2022.
//

import Foundation

class ViewModel {
    var statusText = Dynamic("")
    
    func userButtonPressed(login: String, password: String) {
        if login != User.logins[0].login || password != User.logins[0].passwords {
            statusText.value = "Log in failed."
        } else {
            statusText.value = "You successfully logged in."
        }
    }
}
