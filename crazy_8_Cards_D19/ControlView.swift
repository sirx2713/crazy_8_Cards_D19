//
//  ControlView.swift
//  crazy_8_Cards_D19
//
//  Created by Tafadzwa Alexander Razaro on 2024/04/01.
//

import SwiftUI

struct ControlView: View {
    
    @AppStorage("landingview") var isLandingViewActive: Bool = true
    
    var body: some View {
        ZStack{
            if isLandingViewActive {
                LandingView()
            } else {
                GameView()
            }
        }
    }
}

#Preview {
    ControlView()
}
