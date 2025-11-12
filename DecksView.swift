//
//  SwiftUIView.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/11/25.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var decks: [Deck]
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach($decks) { deck in
                    DeckView(deck: deck, height: Int(UIScreen.main.bounds.width * 0.8) / 2, width: 200)
                        .padding()
                }
            }
        }
    }
}
