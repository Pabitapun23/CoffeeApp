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

var coffees: [Coffee] = [
    .init(imageName: "coffee1", title: "Caramel\nCold Drink", price: "$3.90"),
    .init(imageName: "coffee2", title: "Caramel\n Macchiato", price: "$2.30")
]
