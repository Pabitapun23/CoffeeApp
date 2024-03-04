//
//  CoffeeView.swift
//  CoffeeApp
//
//  Created by Pabita Pun on 2024-03-03.
//

import SwiftUI

struct CoffeeView: View {
    var coffee: Coffee
    var size: CGSize
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            Image(coffee.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.width, height: size.height)
            
        } // GeometryReader
        .frame(height: size.width)
    } // body
}

#Preview {
    CoffeeView(coffee: Coffee(imageName: "", title: "", price: ""), size: CGSize.zero)
}
