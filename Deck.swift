//
//  File.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/6/25.
//

import SwiftUI

class Deck {
    @State var cards: [Card?]
    
    init(cards: [Card?]) {
        self.cards = cards
    }
    
    init() {
        cards = [nil, nil, nil, nil, nil, nil, nil, nil]
    }
    
    func setCard (card: Card?, index: Int) -> Card? {
        let replacedCard: Card? = cards[index]
        cards[index] = card
        return replacedCard
    }
}
