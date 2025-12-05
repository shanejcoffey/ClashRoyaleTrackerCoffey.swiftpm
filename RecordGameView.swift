//
//  SwiftUIView.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/17/25.
//

import SwiftUI
import SwiftData

struct RecordGameView: View {
    
    @Environment(\.modelContext) var context
    @Query var battles: [Battle]
    @State var decks: [Deck]
    
    @State var yourDeck: Deck
    @State var opponentDeck: Deck
    @State private var youWon: Bool = true
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Your Deck")
                    //DeckCreationRecordGame(deck: $yourDeck)
                        //.foregroundStyle(.black)
                        //.font(.title)
                    NavigationLink(destination: PickYourDeckView(decks: decks, deckSelected: $yourDeck)) {
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
                    //DeckCreationRecordGame(deck: $opponentDeck)
                        //.foregroundStyle(.black)
                        //.font(.title)
                    NavigationLink(destination: PickYourDeckView(decks: decks, deckSelected: $opponentDeck)) {
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
            
            HStack(spacing: 16) {
                if youWon {
                    Text("You Won")
                        .font(.title2)
                }
                
                Button {
                    youWon = !youWon
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.green)
                            .frame(width: 150, height: 50)
                        Text("Switch Winner")
                            .foregroundStyle(.black)
                    }
                }
                
                if !youWon {
                    Text("Opponent Won")
                        .font(.title2)
                }
            }
            
            Button {
                
                print("saving game")
                
                let battle = Battle(yourDeck: yourDeck, opponentDeck: opponentDeck, youWon: youWon)
                context.insert(battle)
                do {
                    try context.save()
                    print("battle saved")
                } catch {
                    print("Failed to save battle: \(error)")
                }

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
        .background(Color(red: 119/255.0, green: 184/255.0, blue: 224/255.0))
    }
}
