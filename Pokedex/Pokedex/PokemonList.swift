//
//  PokemonList.swift
//  Pokedex
//
//  Created by Angela Garrovillas on 6/4/25.
//

import Foundation
struct PokemonList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokeListWrapper]
    
    init() {
        count = Int()
        next = nil
        previous = nil
        results = []
    }
    
    struct PokeListWrapper: Codable, Equatable {
        let name: String
        let url: String
    }
    
    func getPokemon() async -> [Pokemon] {
        var pokemon = [Pokemon]()
        for item in results {
            do {
                guard let url = URL(string: item.url) else { break }
                let (data, _) = try await URLSession.shared.data(from: url)
                if let decodedResponse = try? JSONDecoder().decode(Pokemon.self, from: data) {
                    pokemon.append(decodedResponse)
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
        return pokemon
    }
    
}
