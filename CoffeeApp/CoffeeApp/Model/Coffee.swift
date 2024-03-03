//
//  Coffee.swift
//  CoffeeApp
//
//  Created by Pabita Pun on 2024-03-02.
//

import Foundation

struct Coffee : Identifiable {
    var id: UUID = .init()
    var imageName : String
    var title : String
    var price : String
}

