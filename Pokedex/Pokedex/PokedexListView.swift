//
//  PokedexListView.swift
//  Pokedex
//
//  Created by Angela Garrovillas on 6/5/25.
//

import SwiftUI

struct PokedexListView: View {
    var pokemon: [Pokemon]
    var body: some View {
            ForEach(pokemon, id: \.id) { mon in
                ZStack {
                    Color(UIColor(red: 0, green: 0.90, blue: 1, alpha: 1))
                    
                    HStack {
                        Text("\(mon.id)")
                            .font(.title2)
                        AsyncImage(url: URL(string: mon.sprites.frontDefault)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        Text(mon.name.capitalized)
                            .font(.title2)
                            .padding(.trailing)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 120)
                .clipShape(.rect(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(.black, lineWidth: 2)
                )
            }
    }
}

#Preview {
    PokedexListView(pokemon: [Pokemon.example])
}
