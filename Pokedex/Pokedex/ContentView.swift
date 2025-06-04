//
//  ContentView.swift
//  Pokedex
//
//  Created by Angela Garrovillas on 6/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var pokemonList: PokemonList = PokemonList()
    @State private var currentPokemon: [Pokemon] = []
    var body: some View {
        VStack {
            Button("Load Pokemon") {
                Task {
                    await loadPokemonList()
                }
            }
            .onChange(of: pokemonList.results) { oldValue, newValue in
                Task {
                    await currentPokemon = pokemonList.getPokemon()
                }
            }
            List(currentPokemon, id: \.name) { pokemon in
                Text(pokemon.name)
            }
        }
        .padding()
    }
    func loadPokemonList() async {
        let urlString = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=20"
        guard let url = URL(string: urlString) else {
            print("failed to get url")
            return
        }
        do {
            let decoder = JSONDecoder()
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? decoder.decode(PokemonList.self, from: data) {
                pokemonList = decodedResponse
                print("got pokemon")
            } else {
                print("problem with decodedResponse")
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
}

#Preview {
    ContentView()
}
