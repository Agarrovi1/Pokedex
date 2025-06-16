//
//  TypeColor.swift
//  Pokedex
//
//  Created by Angela Garrovillas on 6/6/25.
//

import SwiftUI

func getColorFrom(type: String) -> Color {
    switch type {
    case "grass":
        return Color(UIColor(red: CGFloat(0.2), green: CGFloat(0.838), blue: CGFloat(0.2), alpha: 1))
    case "poison":
        return Color(UIColor.purple)
    case "fire":
        return Color(UIColor.orange)
    case "flying":
        return Color(UIColor(red: CGFloat(0.462), green: CGFloat(0.838), blue: CGFloat(1.000), alpha: 1))
    case "water":
        return Color(UIColor.blue)
    case "bug":
        return Color(UIColor(red: CGFloat(0.000), green: CGFloat(0.977), blue: CGFloat(0.000), alpha: 1))
    case "normal":
        return Color(UIColor(red: CGFloat(0.837), green: CGFloat(0.837), blue: CGFloat(0.837), alpha: 1))
    case "electric":
        return Color(UIColor.yellow)
    case "ground":
        return Color(UIColor(red: CGFloat(0.774), green: CGFloat(0.671), blue: CGFloat(0.425), alpha: 1))
    case "fairy":
        return Color(UIColor(red: CGFloat(1.000), green: CGFloat(0.541), blue: CGFloat(0.847), alpha: 1))
    case "psychic":
        return Color(UIColor(red: CGFloat(1.000), green: CGFloat(0.334), blue: CGFloat(0.847), alpha: 1))
    case "fighting":
        return Color(UIColor.red)
    case "ice":
        return Color(UIColor(red: CGFloat(0.451), green: CGFloat(0.993), blue: CGFloat(1.000), alpha: 1))
    case "rock":
        return Color(UIColor.brown)
    case "steel":
        return Color(UIColor.gray)
    case "ghost":
        return Color(UIColor(red: CGFloat(0.324), green: CGFloat(0.106), blue: CGFloat(0.575), alpha: 1))
    case "dragon":
        return Color(UIColor(red: CGFloat(0.650), green: CGFloat(0.156), blue: CGFloat(1.000), alpha: 1))
    case "dark":
        return Color(UIColor(red: CGFloat(0.005), green: CGFloat(0.096), blue: CGFloat(0.500), alpha: 1))
    default:
        return Color(UIColor.white)
    }
}
