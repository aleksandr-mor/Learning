//
//  RandomCount.swift
//  MVC-Arc
//
//  Created by Aleksandr Morozov on 03.07.2022.
//

import Foundation

class RandomCount {
    func getRandomCount(data: [Crypto]) -> Int {
        let randomCount = Int.random(in: 0..<data.count)
        return randomCount
    }
}
