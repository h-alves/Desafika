//
//  ChallengeCard.swift
//  Desafika
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct ChallengeCard: View {
    var challenge: Challenge
    
    var body: some View {
        VStack(spacing: 8) {
            Text(challenge.description)
                .font(.subheadline)
            
            HStack {
                Image(systemName: challenge.category.symbol)
                    .font(.caption)
                Text(challenge.category.title.capitalized)
                    .font(.caption)
            }
            .opacity(0.6)
        }
        .fontWeight(.bold)
        .foregroundStyle(.chiclete)
        .frame(maxWidth: .infinity)
        .padding(16)
        .multilineTextAlignment(.center)
        .background(.desafikado)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    VStack(spacing: 24) {
        ChallengeCard(challenge: Challenge(description: "Desafio 1", category: Category.house, progress: Progress.none))
        ChallengeCard(challenge: Challenge(description: "Planejem um dia de \"relembrar a infância\", jogando jogos de videogame antigos, assistindo a desenhos animados clássicos e fazendo lanches favoritos da época.", category: Category.movie, progress: Progress.none))
    }
    .padding(32)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.opala)
}
