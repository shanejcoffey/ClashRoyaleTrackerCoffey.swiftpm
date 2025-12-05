//
//  File.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/5/25.
//

import Foundation
import SwiftData

@Model
class Card: Identifiable, Hashable, Codable {
    @Attribute(.unique) var id: String
    var name: String
    var elixir: Int
    var type: String
    var rarity: Int
    var image: String

    init(name: String, elixir: Int, type: String, rarity: Int, image: String = "") {
        self.id = name
        self.name = name
        self.elixir = elixir
        self.type = type
        self.rarity = rarity
        self.image = image
    }

    init() {
        self.id = UUID().uuidString
        self.name = ""
        self.elixir = 0
        self.type = ""
        self.rarity = 0
        self.image = ""
    }
    
    // MARK: Codable
    enum CodingKeys: String, CodingKey {
        case id, name, elixir, type, rarity, image
    }

    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        let elixir = try container.decode(Int.self, forKey: .elixir)
        let type = try container.decode(String.self, forKey: .type)
        let rarity = try container.decode(Int.self, forKey: .rarity)
        let image = try container.decode(String.self, forKey: .image)
        self.init(name: name, elixir: elixir, type: type, rarity: rarity, image: image)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(elixir, forKey: .elixir)
        try container.encode(type, forKey: .type)
        try container.encode(rarity, forKey: .rarity)
        try container.encode(image, forKey: .image)
    }

    // MARK: Hashable
    static func == (lhs: Card, rhs: Card) -> Bool { lhs.name == rhs.name }
    func hash(into hasher: inout Hasher) { hasher.combine(name) }
}
