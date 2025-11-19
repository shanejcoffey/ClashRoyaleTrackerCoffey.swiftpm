//
//  SwiftUIView.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/17/25.
//

import SwiftUI

struct RecordGameScreen: View {
    @State var decks: [Deck]
    @StateObject var yourDeck: Deck = Deck()
    @StateObject var opponentDeck: Deck = Deck()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text("lalala recording the game")
        VStack {
            HStack {
                VStack {
                    Text("Your Deck")
                    DeckCreationRecordGame(deck: yourDeck)
                        .foregroundStyle(.black)
                        .font(.title)
                    NavigationLink(destination: PickYourDeckView(deck: yourDeck, decks: $decks)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.blue)
                                .frame(width: 180, height: 100)
                            Text("Use Saved Deck")
                                .foregroundStyle(.black)
                                .font(.title2)
                        }
                    }
                }
                
                VStack {
                    Text("Opponent Deck")
                    DeckCreationRecordGame(deck: opponentDeck)
                        .foregroundStyle(.black)
                        .font(.title)
                    NavigationLink(destination: PickYourDeckView(deck: opponentDeck, decks: $decks)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.blue)
                                .frame(width: 180, height: 100)
                            Text("Use Saved Deck")
                                .foregroundStyle(.black)
                                .font(.title2)
                        }
                    }
                    
                }
            }
            
            Button {
                
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.yellow)
                        .frame(width: 300, height: 100)
                    Text("Record Game")
                        .foregroundStyle(.black)
                        .font(.title)
                }
            }
            
        }
    }
}
