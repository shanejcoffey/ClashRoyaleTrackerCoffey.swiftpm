//
//  SwiftUIView.swift
//  ClashRoyaleTrackerCoffey
//
//  Created by SHANE COFFEY on 11/6/25.
//

import SwiftUI

struct CardView: View {
    
    @State var card: Card?
    @State var height: CGFloat
    @State var width: CGFloat
    
    var body: some View {
        ZStack {
            Image(card?.image ?? "")
                .resizable()
                .frame(width: width * 0.9, height: height * 0.9)
        }
    }
}

#Preview {
    CardView(card: Card(name: "Knight", elixir: 3, type: "troop", rarity: 0, image: "MusketeerImage"), height: 125, width: 100)
}
