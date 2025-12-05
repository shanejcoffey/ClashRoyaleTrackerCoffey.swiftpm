//
//  SwiftUIView 2.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/11/25.
//

import SwiftUI
import SwiftData

struct DeckCreationView: View {
    
    
    @State var allCards: [Card]
    @State var deck: Deck
    @Query var battles: [Battle]
    @Binding var decks: [Deck]
    @State var showCreatedAlert: Bool = false
    @State var fillDeckAlert: Bool = false
    
    @State private var selectedCard: Card? = nil
    
    let deckWidth = UIScreen.main.bounds.width * 0.9
    
    var unusedCards: [Card] {
        allCards.filter { card in
            !deck.cards.contains { $0.id == card.id }
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
                                            var newCards = deck.cards
                                            newCards[index] = card
                                            deck.cards = newCards
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
                                selectedCard = card
                            }
                    }
                }
                .padding()
            }
            
            Button {
                if !deck.isFull()  {
                    fillDeckAlert = true
                } else {
                    var deckToSave: Deck = Deck(cards: deck.cards)
                    decks.append(deckToSave)
                    showCreatedAlert = true;
                    for i in deck.cards.indices {
                        deck.cards[i] = Card()
                    }
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.green)
                        .frame(width: 100, height: 50)
                    Text("Save Deck")
                        .foregroundStyle(.white)
                }
            }

        }
        .background(Color(red: 119/255.0, green: 184/255.0, blue: 224/255.0))
        .alert("Deck created", isPresented: $showCreatedAlert) {
            
        }
        .alert("Please fill the deck", isPresented: $fillDeckAlert) {
            
        }
    }
}
