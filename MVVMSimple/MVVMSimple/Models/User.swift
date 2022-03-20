//
//  User.swift
//  MVVMSimple
//
//  Created by Aleksandr Morozov on 20.03.2022.
//

import Foundation

struct User {
    let login: String?
    let passwords: String?
}

extension User {
    static var logins = [
        User(login: "12345", passwords: "12345")
    ]
}
