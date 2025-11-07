//
//  SwiftUIView.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/6/25.
//

import SwiftUI

struct DeckView: View {
    
    @Binding var deck: Deck
    let height: Int
    let width: Int
    
    var body: some View {
        ZStack {
            
            
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: CGFloat(width), height: CGFloat(height))
                .foregroundColor(.gray)
            
            VStack {
                ForEach(0..<(deck.cards.count / 4)) { row in
                    HStack {
                        ForEach(0..<4) { index in
                            CardView(card: deck.cards[row * 4 + index], height: CGFloat(height / 2), width: CGFloat(width * 0.8 / 4))
                                .padding(.all, CGFloat(width * 0.02))
                        }
                    }
                }
            }
            .frame(width: CGFloat(width), height: CGFloat(height))
        }
    }
}
