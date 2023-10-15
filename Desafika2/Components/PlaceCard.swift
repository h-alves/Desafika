//
//  PlaceCard.swift
//  Desafika2
//
//  Created by Henrique Semmer on 15/10/23.
//

import SwiftUI

struct PlaceCard: View {
    let place: Place
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(place.name.capitalized)
                .fontWeight(.bold)
                .foregroundStyle(.meiaNoite)
                .frame(height: 18)
            
            HStack {
                Text(place.category)
                
                if place.price > 0 && place.category != "" {
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
                
                if place.distance != 0 {
                    Text("\(place.distance, specifier: "%.1f") km")
                        .font(.caption)
                        .foregroundStyle(.meiaNoite)
                        .opacity(0.5)
                }
            }
        }
        .padding()
        .frame(width: 227, height: 93)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    VStack {
        PlaceCard(place: Place(name: "Nome", category: "Parque", price: 2, review: 4.5, distance: 5.9832))
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.opala)
}
