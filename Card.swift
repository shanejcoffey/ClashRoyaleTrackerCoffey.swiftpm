//
//  File.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/5/25.
//

import Foundation

struct Card: Identifiable, Hashable {
    var id: String { name }
    let name: String
    let elixir: Int
    let type: String
    let rarity: Int
    let image: String
    
    init(name: String, elixir: Int, type: String, rarity: Int, image: String) {
        self.name = name
        self.elixir = elixir
        self.type = type
        self.rarity = rarity
        self.image = image
    }
    
    init(name: String, elixir: Int, type: String, rarity: Int) {
        self.name = name
        self.elixir = elixir
        self.type = type
        self.rarity = rarity
        self.image = ""
    }
}

let allCards: [Card] = [
    Card(name: "Knight", elixir: 3, type: "Troop", rarity: 0, image: "KnightImage"),
    Card(name: "Archers", elixir: 3, type: "Troop", rarity: 0, image: "ArchersImage"),
    Card(name: "Bomber", elixir: 2, type: "Troop", rarity: 0, image: "BomberImage"),
    Card(name: "Arrows", elixir: 3, type: "Spell", rarity: 0, image: "ArrowsImage"),
    Card(name: "Giant", elixir: 5, type: "Troop", rarity: 1, image: "GiantImage"),
    Card(name: "Musketeer", elixir: 4, type: "Troop", rarity: 1, image: "MusketeerImage"),
    Card(name: "Mini P.E.K.K.A", elixir: 4, type: "Troop", rarity: 1, image: "MiniPEKKAImage"),
    Card(name: "Fireball", elixir: 4, type: "Spell", rarity: 1, image: "FireballImage"),
    Card(name: "Witch", elixir: 5, type: "Troop", rarity: 2, image: "WitchImage"),
    Card(name: "Skeleton Army", elixir: 3, type: "Troop", rarity: 2, image: "SkeletonArmyImage"),
    Card(name: "Baby Dragon", elixir: 4, type: "Troop", rarity: 2, image: "BabyDragonImage"),
    Card(name: "Prince", elixir: 5, type: "Troop", rarity: 2, image: "PrinceImage")
]
