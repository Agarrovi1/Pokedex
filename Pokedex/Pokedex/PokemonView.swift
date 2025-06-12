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
            Color.red
                .ignoresSafeArea()
            ScrollView(.vertical) {
                ZStack {
                    Color(UIColor(red: 0, green: 0.90, blue: 1, alpha: 1))
                    LazyVStack {
                        AsyncImage(url: URL(string: pokemon.sprites.frontDefault)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text("#\(pokemon.id) \(pokemon.name.capitalized)")
                            .font(.title)
                        
                        HStack {
                            ForEach(pokemon.types, id: \.slot) { type in
                                TypeCapsuleView(type: type)
                            }
                        }
                        Divider()
                        VStack {
                            Text(pokemon.getAbilities().count > 1 ? "Abilities" : "Ability")
                                .font(.title2)
                                .bold()
                            if pokemon.getAbilities().isEmpty {
                                Text("None")
                            } else {
                                ForEach(pokemon.getAbilities(), id: \.ability.name) { hiddenAbility in
                                    Text(hiddenAbility.ability.name.capitalized)
                                }
                                .padding(.bottom)
                            }
                            
                            
                            Text(pokemon.getHiddenAbilities().count > 1 ? "Hidden Abilities" : "Hidden Ability")
                                .font(.title2)
                                .bold()
                            if pokemon.getHiddenAbilities().isEmpty {
                                Text("None")
                            } else {
                                ForEach(pokemon.getHiddenAbilities(), id: \.ability.name) { hiddenAbility in
                                    Text(hiddenAbility.ability.name.capitalized)
                                }
                            }
                            
                        }
                        
                        Divider()
                        Text("Learnable Moves")
                            .font(.title2)
                            .bold()
                        ForEach(pokemon.moves, id: \.move.name) { move in
                            Text(move.getMoveName().capitalized)
                        }
                        Divider()
                        
                        Text("Stats")
                            .font(.title2)
                            .bold()
                        StatView(pokemonStats: pokemon.stats)
                    }
                }
            }
            .containerRelativeFrame(.vertical) { size, axis in
                size * 0.9
            }
            .background(Color(UIColor(red: 0, green: 0.90, blue: 1, alpha: 1)))
            .border(.black, width: 10)
        }
    }
}

#Preview {
    PokemonView(pokemon: Pokemon.example)
}
