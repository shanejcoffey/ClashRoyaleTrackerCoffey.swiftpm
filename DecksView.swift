//
//  SwiftUIView.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/11/25.
//

import SwiftUI

struct DecksView: View {
    
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
                }
            }
        }
    }
}
