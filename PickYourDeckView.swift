//
//  SwiftUIView.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/11/25.
//

import SwiftUI

struct PickYourDeckView: View {
    
    @ObservedObject var deck: Deck
    @Binding var decks: [Deck]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(decks) { deck in
                    SmallDeckView(deck: deck, height:  Int(UIScreen.main.bounds.width * 0.9 * 0.625) / 2, width: Int(UIScreen.main.bounds.width * 0.9) / 2)
                        .padding()
                        .onTapGesture {
                            self.deck.cards = deck.cards
                        }
                }
            }
        }
    }
}
