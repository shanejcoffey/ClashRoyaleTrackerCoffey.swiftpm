import SwiftUI

struct ContentView: View {

    @State var decks: [Deck] = []
    
    @State var firstDeck: Deck = Deck(cards: [
        allCards[0], allCards[1], allCards[2], allCards[3], allCards[4],
        allCards[8], allCards[11], allCards[7],
    ])

    @State var d2: Deck = Deck(cards: [
        allCards[0], allCards[1], allCards[2], allCards[3], allCards[4],
        allCards[8], allCards[11], allCards[7],
    ])
    @State var d3: Deck = Deck(cards: [
        allCards[6], allCards[1], allCards[2], allCards[11], allCards[4],
        allCards[8], allCards[11], allCards[7],
    ])
    @State var d4: Deck = Deck(cards: [
        allCards[0], allCards[1], allCards[2], allCards[10], allCards[4],
        allCards[8], allCards[9], allCards[8],
    ])

    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello World!")

                /*Button("add decks") {
                 decks.append(firstDeck)
                 decks.append(d2)
                 decks.append(d3)
                 decks.append(d4)
                 }*/

                NavigationLink(destination: RecordGameScreen(decks: decks)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.yellow)
                            .frame(width: 300, height: 100)
                        Text("Record Game")
                            .foregroundStyle(.black)
                            .font(.title)
                    }
                }
                
                NavigationLink(
                    destination: DeckCreationView(decks: $decks, deck: Deck())
                ) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.green)
                            .frame(width: 300, height: 100)
                        Text("Create deck")
                            .foregroundStyle(.black)
                            .font(.title)
                    }
                }
                
                HStack {
                    NavigationLink(destination: DecksView(decks: $decks)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.blue)
                                .frame(width: 140, height: 100)
                            Text("Decks")
                                .foregroundStyle(.black)
                                .font(.title2)
                        }
                    }
                    
                    NavigationLink(destination: ViewCards(width: UIScreen.main.bounds.width)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.blue)
                                .frame(width: 140, height: 100)
                            Text("Cards")
                                .foregroundStyle(.black)
                                .font(.title2)
                        }
                    }
                }
            }
        }

    }
}
