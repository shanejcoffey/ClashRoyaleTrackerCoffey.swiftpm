//
//  File.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/23/25.
//

import Foundation
import SwiftUI
import SwiftData

@Model
public class Battle {
    @Relationship var yourDeck: Deck
    @Relationship var opponentDeck: Deck
    var youWon: Bool
    
    init (yourDeck: Deck, opponentDeck: Deck, youWon: Bool) {
        self.yourDeck = yourDeck
        self.opponentDeck = opponentDeck
        self.youWon = youWon
    }
}
