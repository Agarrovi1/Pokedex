//
//  PokemonView.swift
//  Pokedex
//
//  Created by Angela Garrovillas on 6/6/25.
//

import SwiftUI

struct PokemonView: View {
    var pokemon: Pokemon
    var body: some View {
        ZStack {
            Color(UIColor(red: 0, green: 0.90, blue: 1, alpha: 1))
            VStack {
                AsyncImage(url: URL(string: pokemon.sprites.frontDefault)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                } placeholder: {
                    ProgressView()
                }
                
                Text(pokemon.name.capitalized)
            }
        }
    }
}

#Preview {
    PokemonView(pokemon: Pokemon.example)
}
