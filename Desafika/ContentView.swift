//
//  ContentView.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

enum Screen {
    case splash
    case onboarding
    case home
    case challenge
    case saved
}

struct ContentView: View {
    @StateObject var router = RouterService.shared
    
    var body: some View {
        ZStack {
            switch(router.screen) {
            case .splash: SplashView()
            case .onboarding: OnboardingView()
            case .home: HomeView()
                    .transition(.opacity)
            case .challenge: ChallengeView()
                    .transition(.push(from: .trailing))
            case .saved: SavedView()
                    .transition(.push(from: .trailing))
                
            }
        }
    }
}

#Preview {
    ContentView()
}
