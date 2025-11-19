//
//  SwiftUIView 2.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/11/25.
//

import SwiftUI

struct DeckCreationRecordGame: View {
    @ObservedObject var deck: Deck
    
    
    @State private var selectedCard: Card? = nil
    
    let deckWidth = UIScreen.main.bounds.width * 0.48
    
    var unusedCards: [Card] {
        allCards.filter { card in
            !deck.cards.contains { $0?.id == card.id }
        }
    }
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            DeckView(deck: deck, height: Int(deckWidth * 0.625), width: Int(deckWidth))
                .overlay(
                    VStack(spacing: 10) {
                        ForEach(0..<2, id: \.self) { row in
                            HStack(spacing: 10) {
                                ForEach(0..<4, id: \.self) { col in
                                    let index = row * 4 + col
                                    ZStack {
                                        Color.clear
                                        if selectedCard != nil {
                                            RoundedRectangle(cornerRadius: 6)
                                                .stroke(Color.blue, lineWidth: 3)
                                        }
                                    }
                                    .frame(width: CGFloat(deckWidth * 0.9 / 4), height: CGFloat(deckWidth * 1.0888 / 4))
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        if let card = selectedCard {
                                            deck.cards[index] = card
                                            selectedCard = nil
                                        }
                                    }
                                }
                            }
                        }
                    }
                )


                                    
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(unusedCards) { card in
                        CardView(card: card, height: CGFloat(deckWidth * 1.2388 / 4), width: CGFloat(deckWidth / 4))
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(selectedCard?.id == card.id ? Color.blue : Color.clear, lineWidth: 3)
                            )
                            .onTapGesture {
                                print("selected \(card.name)")
                                selectedCard = card
                            }
                    }
                }
                .padding()
            }

        }
    }
}
