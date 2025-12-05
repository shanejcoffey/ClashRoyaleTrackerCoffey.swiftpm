//
//  SwiftUIView.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/6/25.
//

import SwiftUI
import SwiftData

struct DeckView: View {

    @State var deck: Deck
    let height: Int
    let width: Int
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var cardWidth: CGFloat {
        CGFloat(width) * 0.8 / 4
    }
    
    var cardHeight: CGFloat {
        CGFloat(height) * 0.8 / 2
    }

    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: CGFloat(width) / 15)
                .foregroundStyle(Color(red: 0.067, green: 0.067, blue: 0.518))
                .frame(width: CGFloat(width), height: CGFloat(height))
            
            LazyVGrid(columns: columns, spacing : CGFloat(width) * 0.2 / 4) {
                ForEach(deck.cards.indices, id:\.self) { i in
                    let card = deck.cards[i]
                    if card.name != "" {
                        ZStack {
                            RoundedRectangle(cornerRadius: cardWidth / 10)
                                .frame(width: cardWidth, height: cardHeight)
                                .foregroundStyle(.indigo)
                            CardView(card: card, height: cardHeight, width: cardWidth)
                        }
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: cardWidth / 10)
                                .frame(width: cardWidth, height: cardHeight)
                                .foregroundStyle(.indigo)
                            CardView(height: cardHeight, width: cardWidth)
                        }
                    }
                }
            }
        }
        .background(Color(red: 119/255.0, green: 184/255.0, blue: 224/255.0))
        .frame(width: CGFloat(width), height: CGFloat(height))
    }
}
