//
//  File.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/6/25.
//

import SwiftUI
import SwiftData

@Model
class Deck: Identifiable, ObservableObject {
    @Relationship var cards: [Card]
    
    init(cards: [Card]) {
        self.cards = cards
    }
    
    init() {
        cards = [Card(), Card(), Card(), Card(), Card(), Card(), Card(), Card()]
    }
    
    func setCard (card: Card, index: Int) -> Card {
        let replacedCard: Card = cards[index]
        var newCards = cards
        newCards[index] = card
        cards = newCards
        return replacedCard
    }
    
    func isFull() -> Bool {
        for card in cards {
            if card.name == "" {
                return false
            }
        }
        return true
    }
}
