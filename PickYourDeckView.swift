//
//  SwiftUIView.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/11/25.
//

import SwiftUI
import SwiftData

struct PickYourDeckView: View {
    @State var decks: [Deck]
    @Binding var deckSelected: Deck

    let columns: [GridItem] = [.init(.flexible()), .init(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(decks) { deck in
                    SmallDeckView(deck: deck, height:  Int(UIScreen.main.bounds.width * 0.9 * 0.625) / 2, width: Int(UIScreen.main.bounds.width * 0.9) / 2)
                        .onTapGesture {
                            deckSelected.cards = deck.cards
                        }
                }
            }
        }
        .background(Color(red: 119/255.0, green: 184/255.0, blue: 224/255.0))
    }
}
