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
        // if you want to decrease the size of the Image, then change its card size
        let cardSize = size.width * 1
        // since I want to show max three cards on the display
        // since we used scaling to decrease the view size, add extra one
        let maxCardsDisplaySize = size.width * 3
        
        GeometryReader { proxy in
            let _size = proxy.size
            // scaling animation
            // current card offset
            let offset = proxy.frame(in: .named("SCROLL")).minY - (size.height - cardSize)
            let scale = offset <= 0 ? (offset / maxCardsDisplaySize) : 0
            let reducedScale = 1 + scale
            let currentCardScale = offset / cardSize
            
            Image(coffee.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: _size.width, height: _size.height)
                // to avoid warning
                // updating anchor based on the current card scale
                .scaleEffect(reducedScale < 0 ? 0.001 : reducedScale, anchor: .init(x: 0.5, y: 1 - (currentCardScale / 2.4)))
            
               // when it's coming from bottom animating the scale from large to actual
                .scaleEffect(offset > 0 ? 1 + currentCardScale : 1, anchor: .top)
            
            // to remove the excess next view using offset to move the view in real time
                .offset(y: offset > 0 ? currentCardScale * 200 : 0)
            
            // making it more compact
                .offset(y: currentCardScale * -130)
            
//            Text("\(offset)")
            
        } // GeometryReader
        .frame(height: cardSize)
    } // body
}

#Preview {
    CoffeeView(coffee: Coffee(imageName: "", title: "", price: ""), size: CGSize.zero)
}
