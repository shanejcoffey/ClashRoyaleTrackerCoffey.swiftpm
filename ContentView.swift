import SwiftUI

struct ContentView: View {
    
    @State var firstDeck: Deck = Deck(cards: [allCards[0], allCards[1], allCards[2], allCards[3], allCards[4], allCards[5], allCards[6], allCards[7]])
    
    var body: some View {
        VStack {
            Text("Hello World!")
            DeckView(deck: $firstDeck, height: 250, width: 400)
        }
    }
}
