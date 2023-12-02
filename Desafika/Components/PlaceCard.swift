//
//  PlaceCard.swift
//  Desafika
//
//  Created by Henrique Semmer on 15/10/23.
//

import SwiftUI

struct PlaceCard: View {
    let place: Place
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(place.name.capitalized)
                .fontWeight(.bold)
                .foregroundStyle(.meiaNoite)
                .frame(height: 18)
            
            HStack {
                Text("\(place.distance, specifier: "%.1f") km")
                
                if place.price > 0 && place.distance != 0 {
                    Text("|")
                }
                
                if place.price > 0 {
                    Text(String(repeating: "$", count: place.price))
                }
            }
            .font(.footnote)
            .foregroundStyle(.meiaNoite)
            .opacity(0.5)
            
            HStack {
                HStack(spacing: 0) {
                    if place.review > 0 {
                        if place.review >= 1 {
                            ForEach(1...Int(place.review), id: \.self) { _ in
                                Image(systemName: "heart.fill")
                            }
                        }
                        if place.review != 5 {
                            ForEach(1...(5 - Int(place.review)), id: \.self) { _ in
                                Image(systemName: "heart")
                            }
                        }
                    } else {
                        Text("Sem avaliações")
                            .foregroundStyle(.meiaNoite)
                            .opacity(0.5)
                    }
                }
                .font(.footnote)
                .foregroundStyle(.papaya)
                
                Spacer()
            }
        }
        .padding(16)
        .frame(width: 227, height: 93)
        .background(.desafikado)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    VStack {
        ScrollView(.horizontal) {
            HStack {
                PlaceCard(place: Place(name: "Teste 1", category: "Parque", price: 2, review: 4.5, distance: 5.5632))
                PlaceCard(place: Place(name: "Teste 2", category: "Parque", price: 0, review: 1, distance: 2))
                PlaceCard(place: Place(name: "Teste 3", category: "", price: 2, review: 4.5, distance: 7.7))
                PlaceCard(place: Place(name: "Teste 4", category: "", price: 0, review: 5, distance: 1.54232324))
                PlaceCard(place: Place(name: "Teste 5", category: "Parque", price: 2, review: 0, distance: 22))
            }
            .padding(.horizontal, 32)
        }
        .padding(.horizontal, -32)
        .scrollIndicators(.hidden)
    }
    .padding(32)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.opala)
}
