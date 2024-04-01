//
//  ContentView.swift
//  crazy_8_Cards_D19
//
//  Created by Tafadzwa Alexander Razaro on 2024/04/01.
//

import SwiftUI

struct LandingView: View {
    
    @AppStorage("landingview") var isLandingViewActive: Bool = true
    
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating:Bool = false
    
    var body: some View {
        ZStack{
            Image("background-2")
                .resizable()
                .ignoresSafeArea(.all, edges: .all)
            VStack{
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Spacer()
                ZStack {
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Play Now!")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
        
                    HStack{
                        Capsule()
                            .fill(Color("ColorOrange"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    
                    HStack {
                        ZStack{
                            Circle()
                                .fill(Color("Orange"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80{
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded{_ in
                                    withAnimation(Animation.easeOut(duration: 0.4)){
                                        if buttonOffset > buttonWidth / 2{
                                            buttonOffset = buttonWidth - 80
                                            isLandingViewActive = false
                                        } else{
                                            buttonOffset = 0
                                        }
                                    }
                                }
                        )//: GESTURE
                        
                        Spacer()
                    }
                    
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeIn(duration: 1), value: isAnimating)
               
            }
        }
        .onAppear(perform: {
            isAnimating = true
        })
    }
}

#Preview {
    LandingView()
}
