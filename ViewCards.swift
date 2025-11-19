//
//  SwiftUIView 2.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/14/25.
//

import SwiftUI

struct ViewCards: View {
    
    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var width: CGFloat
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(allCards) { card in
                    CardView(card: card, height: CGFloat(width * 1.2388 / 4), width: CGFloat(width / 4))
                }
            }
            .padding()
        }
    }
}

#Preview {
    ViewCards(width: UIScreen.main.bounds.width)
}
