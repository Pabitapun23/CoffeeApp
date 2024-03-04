//
//  Homepage.swift
//  CoffeeApp
//
//  Created by Pabita Pun on 2024-03-03.
//

import SwiftUI

struct Homepage: View {
    // Gesture Properties
    @State var offsetY : CGFloat = 0
    @State var currentIndex : CGFloat = 0
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            // card size is the size of the screen width
            let cardSize = size.width * 1
            
            // Bttom gradient background
            LinearGradient(colors: [
                .clear,
                Color("Brown").opacity(0.2),
                Color("Brown").opacity(0.45),
                Color("Brown")
            ], startPoint: .top, endPoint: .bottom)
            .frame(height: 300)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            
            // Header View
            HeaderView()
            
            VStack(spacing: 0) {
                ForEach(coffees) { coffee in
                    CoffeeView(coffee: coffee, size: size)
                }
            } // VStack
            .frame(width: size.width)
            .padding(.top, size.height - cardSize)
            .offset(y: offsetY)
            .offset(y: -currentIndex * cardSize)
        } // GeometryReader
        .coordinateSpace(name: "SCROLL")
        .contentShape(Rectangle())
        .gesture(
            DragGesture()
                .onChanged({ value in
                    // Slowing down the Gesture
                    offsetY = value.translation.height * 0.4
                }).onEnded({ value in
                    let translation = value.translation.height
                    
                    withAnimation(.easeInOut) {
                        
                        if translation > 0 {
                            // 250 -> update it for your own usage
                            if currentIndex > 0 && translation > 250 {
                                currentIndex -= 1
                            }
                        } else {
                            if currentIndex < CGFloat(coffees.count - 1) && -translation > 250 {
                                currentIndex += 1
                            }
                        } // if-else
                        
                        offsetY = .zero
                    } // withAnimation
                    
                }) // .onEnded
        ) // .gesture
        .preferredColorScheme(.light)
    } // body
    
    @ViewBuilder
    func HeaderView() -> some View{
        VStack {
            HStack {
                Button {
                    
                } label: {
                     Image(systemName: "chevron.left")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                } // Button
                
                Spacer()
 
                Button {
                    
                } label: {
                     Image(systemName: "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                } // Button
            } // HStack
            
            // Animation Slider
            GeometryReader {
                let size = $0.size
                
                HStack(spacing: 0){
                    ForEach(coffees) { coffee in
                        VStack(spacing: 15) {
                            Text(coffee.title)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
                                .multilineTextAlignment(.center)
                            
                            Text(coffee.price)
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        } // VStack
                        .frame(width: size.width)
                    } // ForEach
                } // HStack
                .offset(x: currentIndex * -size.width)
                .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.8), value: currentIndex)
            } // GeometryReader
            .padding(.top, -5)
            
        } // VStack
    } // func-HeaderView
    
    
}

#Preview {
    Homepage()
}
