//
//  Homepage.swift
//  CoffeeApp
//
//  Created by Pabita Pun on 2024-03-03.
//

import SwiftUI

struct Homepage: View {
    var body: some View {
        GeometryReader {
            let size = $0.size
            // card size is the size of the screen width
            let cardSize = size.width
            
            VStack(spacing: 0) {
                ForEach(coffees) { coffee in
                    CoffeeView(coffee: coffee, size: size)
                }
            }
            .frame(width: size.width)
            .padding(.top, size.height - cardSize)
        }
    }
}

#Preview {
    Homepage()
}
