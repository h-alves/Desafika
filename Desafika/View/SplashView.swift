//
//  SplashView.swift
//  Desafika
//
//  Created by Heloisa Pereira Machado on 28/11/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Spacer()

                VStack{
                    Spacer()
                    Image("Desafika")
                    Spacer()
                }
           
        }
        .background(.opala)
        .onAppear {
            Task {
                try await Task.sleep(nanoseconds: Duration(seconds: 1).inNanoseconds())
                
                if StorageService.shared.hasSeenOnboarding() {
                    print("User has seen onboarding. Navigating to home.")
                    RouterService.shared.navigate(.home)
                } else {
                    print("User has not seen onboarding. Navigating to onboarding.")
                    StorageService.shared.setOnboardingSeen(true)
                    RouterService.shared.navigate(.onboarding)
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
