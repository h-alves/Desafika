//
//  NoChallengeView.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct NoChallengeView: View {
    var body: some View {
        VStack(spacing: 24) {
            Image("noChallenge")
                .resizable()
                .frame(width: 220, height: 151)
            
            Text("Vocês já completaram todos os desafios possíveis!")
                .font(.headline)
                .foregroundStyle(.meiaNoite)
                .opacity(0.5)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 32)
        .background(.opala)
    }
}

#Preview {
    NoChallengeView()
}
