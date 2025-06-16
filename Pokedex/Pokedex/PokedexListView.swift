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
                NavigationLink {
                    PokemonView(pokemon: mon)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(UIColor(red: 0, green: 0.90, blue: 1, alpha: 1)))
                            .padding(5)
                            .padding(.horizontal, 20)
                        HStack {
                            Text("\(mon.id)")
                                .font(.title2)
                            AsyncImage(url: URL(string: mon.sprites.frontDefault)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
                            } placeholder: {
                                ProgressView()
                            }
                            
                            Text(mon.name.capitalized)
                                .font(.title2)
                                .padding(.trailing)
                            
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder(.black, lineWidth: 2)
                            .padding(5)
                            .padding(.horizontal, 20)
                    )
                    .background(Color(UIColor(red: 0.20, green: 0.80, blue: 1, alpha: 1)))
                }
                
            }
    }
}

#Preview {
    PokedexListView(pokemon: [Pokemon.example])
}
