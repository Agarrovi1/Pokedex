//
//  Pokemon.swift
//  Pokedex
//
//  Created by Angela Garrovillas on 6/4/25.
//

import Foundation

enum SpriteMode {
    case frontDefault
    case frontShiny
}

struct Pokemon: Codable {
    let abilities: [AbilityWrapper]
    let id: Int
    let moves: [MoveWrapper]
    let types: [TypeWrapper]
    let stats: [StatWrapper]
    let name: String
    let sprites: Sprites
    
    struct Sprites: Codable {
        let frontDefault: String
        let frontShiny: String
        
        private enum CodingKeys: String,CodingKey {
            case frontDefault = "front_default"
            case frontShiny = "front_shiny"
        }
    }
    
    struct StatWrapper: Codable {
        let base_stat: Int
        let stat: Stat
        
        func getStatName() -> String {
            self.stat.name
        }
        struct Stat: Codable {
            let name: String
        }
    }
    
    struct TypeWrapper: Codable {
        let slot: Int
        let type: PokeType
        func getTypeName() -> String {
            return self.type.name
        }
        
        struct PokeType: Codable {
            let name: String
        }
    }
    
    struct MoveWrapper: Codable {
        let move: Move
        
        func getMoveName() -> String {
            return self.move.name
        }
        
        struct Move: Codable {
            let name: String
            let url: String
        }
    }
    
    struct AbilityWrapper: Codable {
        let ability: Ability
        func getAbilityInfo() -> (name:String,isHidden:Bool) {
            return(self.ability.name,self.ability.isHidden ?? false)
        }
        
        struct Ability: Codable {
            let name: String
            let isHidden: Bool?
            
            private enum CodingKeys: String,CodingKey {
                case name
                case isHidden = "is_hidden"
            }
        }
    }
    
    static let example = Pokemon(abilities: [.init(ability: .init(name: "overgrow", isHidden: false)), .init(ability: .init(name: "chlorophyll", isHidden: true))], id: 1, moves: [.init(move: .init(name: "razor-wind", url: "https://pokeapi.co/api/v2/move/13/"))], types: [.init(slot: 1, type: .init(name: "grass")), .init(slot: 2, type: .init(name: "poison"))], stats: [.init(base_stat: 45, stat: .init(name: "hp"))], name: "bulbasaur", sprites: .init(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", frontShiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png"))
}
