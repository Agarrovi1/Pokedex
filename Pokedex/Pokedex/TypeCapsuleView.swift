//
//  TypeCapsuleView.swift
//  Pokedex
//
//  Created by Angela Garrovillas on 6/6/25.
//

import SwiftUI

struct TypeCapsuleView: View {
    var lightTypes: Set<String> = ["ice", "electric"]
    var type: Pokemon.TypeWrapper
    var body: some View {
        ZStack {
            Capsule()
                .fill(getColorFrom(type: type.getTypeName()))
                .frame(maxWidth: 120, maxHeight: 60)
            Text(type.getTypeName().capitalized)
                .foregroundStyle(lightTypes.contains(type.getTypeName()) ? .black : .white)
                .fontWeight(.bold)
            //            .padding()
            //            .background(getColorFrom(type: type.getTypeName()), in: Capsule())
            
        }
                
    }
}

#Preview {
    TypeCapsuleView(type: Pokemon.TypeWrapper.init(slot: 1, type: Pokemon.TypeWrapper.PokeType.init(name: "electric")))
}
