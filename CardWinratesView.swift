//
//  CardWinratesView.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/24/25.
//

import SwiftUI
import SwiftData

struct CardWinratesView: View {
    
    @Query var battles: [Battle]
    var allCards: [Card]
    
    @State private var sortBy: String = "Name"
    
    var sortedCards: [Card] {
        let cardsWithRates = allCards.map { ($0, winrate(battlesForCard(for: $0))) }
        
        switch sortBy {
        case "Best":
            return cardsWithRates.sorted { $0.1 > $1.1 }.map { $0.0 }
        case "Worst":
            return cardsWithRates.sorted { $0.1 < $1.1 }.map { $0.0 }
        default:
            return cardsWithRates.sorted { $0.0.name < $1.0.name }.map { $0.0 }
        }
    }
    
    var body: some View {
        VStack {
            Picker("Sort by", selection: $sortBy) {
                Text("Name").tag("Name")
                Text("Best").tag("Best")
                Text("Worst").tag("Worst")
            }
            .pickerStyle(.segmented)
            .padding()
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(sortedCards) { card in
                        let related = battlesForCard(for: card)
                        let rate = winrate(related)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                if card.name != "" {
                                    CardView(card: card, height: 50, width: 40)
                                }
                                VStack(alignment: .leading) {
                                    Text(card.name)
                                        .font(.title2)
                                    Text("Winrate: \(rate)% (\(related.count) battles)")
                                        .font(.headline)
                                }
                            }
                        }
                        .padding()
                        .background(Color(.blue))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                }
                .padding()
            }
        }
        .background(Color(red: 119/255.0, green: 184/255.0, blue: 224/255.0))
        .onAppear {
            print("opened view")
            for battle in battles {
                print("Opponent Deck: \(battle.opponentDeck.cards.map { $0.name })")
            }
        }

    }
    
    func battlesForCard(for card: Card) -> [Battle] {
        let filtered = battles.filter { battle in
            battle.opponentDeck.cards.contains { $0.name == card.name }
        }
        
        for battle in filtered {
            print("Battle ID: \(battle.id), Opponent Deck: \(battle.opponentDeck.cards.map { $0.name })")
        }
        
        return filtered
    }

    
    func winrate(_ games: [Battle]) -> Int {
        if games.isEmpty { return 0 }
        let wins = games.filter { $0.youWon }.count
        return Int((Double(wins) / Double(games.count)) * 100)
    }
}
