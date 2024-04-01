//
//  GameView.swift
//  crazy_8_Cards_D19
//
//  Created by Tafadzwa Alexander Razaro on 2024/04/01.
//

import SwiftUI

struct GameView: View {
    
    @AppStorage("landingview") var isLandingViewActive: Bool = false
    @State private var isAnimating:Bool = false
    
    @State var background = "background-2"
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack{
            Image(background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all, edges: .all)
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    deal()
                }, label: {
                    Image("button")
                })
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("PLAYER")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        Text("\(playerScore)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(Color.white)
                        Text("\(cpuScore)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                }
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation{
                            isLandingViewActive = true
                        }
                    }, label: {
                        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                            .imageScale(.large)
                        
                        Text("Restart")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                    })
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(
                        .capsule
                        
                    )
                    .controlSize(.large)
                    Spacer()
                    Button(action: {
                        reset()
                    }, label: {
                        Image(systemName: "memories")
                            .imageScale(.large)
                        Text("Reset")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(.bold)
                    })
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(
                        .capsule
                        
                    )
                    .controlSize(.large)
                    Spacer()
                }
                Spacer()
            }
        }.onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                isAnimating = true
            })
        })
    }
    
    func deal() {
        //Randomise the player cards
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        //Randomise the cpu cards
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        //Add 4 to player score
        if playerCard > cpuCard {
            playerScore += 4
        }
        
        //Add 4 to cpu score
        if cpuCard > playerCard {
            cpuScore += 4
        }
        
        //Add 1 to both if it is a tie
        else if playerCard == cpuCard {
            playerScore += 1
            cpuScore += 1
        }
    }
    
    func reset(){
        //Reset values to default
        playerCard = "back"
        cpuCard = "back"
        playerScore = 0
        cpuScore = 0
    }
}

#Preview {
    GameView()
}
