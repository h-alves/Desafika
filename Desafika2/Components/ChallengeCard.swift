//
//  ChallengeCard.swift
//  Desafika2
//
//  Created by Henrique Semmer on 12/10/23.
//

import SwiftUI

struct ChallengeCard: View {
    var challenge: Challenge
    
    var body: some View {
        VStack(spacing: 8) {
            Text(challenge.description)
            
            HStack {
                Image(systemName: challenge.category.symbol)
                    .font(.system(size: 8))
                Text(challenge.category.title.capitalized)
                    .font(.caption2)
            }
            .opacity(0.6)
        }
        .font(.callout)
        .fontWeight(.bold)
        .foregroundStyle(.chiclete)
        .frame(maxWidth: .infinity)
        .padding(22)
        .multilineTextAlignment(.center)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    VStack {
        ChallengeCard(challenge: Challenge(description: "Desafio 1", category: Category.house, progress: Progress.none))
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.opala)
}
