//
//  File.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/6/25.
//

import SwiftUI

class Deck: Identifiable, ObservableObject {
    @Published var cards: [Card?]
    
    init(cards: [Card?]) {
        self.cards = cards
    }
    
    init() {
        cards = [nil, nil, nil, nil, nil, nil, nil, nil]
    }
    
    func setCard (card: Card?, index: Int) -> Card? {
        let replacedCard: Card? = cards[index]
        var newCards = cards
        newCards[index] = card
        cards = newCards
        return replacedCard
    }
}
