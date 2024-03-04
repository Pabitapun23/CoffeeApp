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

// Data manager for coffee - array of coffee
var coffees: [Coffee] = [
    .init(imageName: "coffee1", title: "Caramel\nCold Drink", price: "$3.90"),
    .init(imageName: "coffee2", title: "Caramel\n Macchiato", price: "$2.30"),
    .init(imageName: "coffee5", title: "Iced Coffee\n Mocha", price: "$9.20"),
    .init(imageName: "coffee4", title: "Toffe Nut\nCrunch Latte", price: "$12.30"),
    .init(imageName: "coffee2", title: "Styled Cold\nCoffee", price: "$8.30"),
    .init(imageName: "coffee4", title: "Classic Irish\nCoffee", price: "$6.90"),
    .init(imageName: "coffee5", title: "Black Tea\nLatte", price: "$2.10"),
]
