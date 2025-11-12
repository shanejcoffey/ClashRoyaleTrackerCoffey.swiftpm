//
//  DeckView 2.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/12/25.
//


//
//  SwiftUIView.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/6/25.
//

import SwiftUI

struct DeckView: View {

    @ObservedObject var deck: Deck
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
                    if let card = deck.cards[i] {
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
        .frame(width: CGFloat(width), height: CGFloat(height))
    }
}
