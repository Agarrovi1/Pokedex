//
//  StatView.swift
//  Pokedex
//
//  Created by Angela Garrovillas on 6/9/25.
//

import SwiftUI

struct StatView: View {
    var pokemonStats: [Pokemon.StatWrapper]
    var body: some View {
        ForEach(pokemonStats, id: \.stat.name) { stat in
            VStack {
                HStack {
                    Text(stat.getStatName())
                    Text("\(stat.base_stat)")
                }
            }
        }
        
    }
}

#Preview {
    StatView(pokemonStats: Pokemon.example.stats)
}
