//
//  StackedCircles.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 08.04.2023.
//

import SwiftUI

struct StackedCircles: View {
    
    @State var players: [Player]
    @State var size: CGFloat
    
    init(players: [Player], size: CGFloat) {
        self.players = players
        self.size = size
    }

    var body: some View {
        ZStack {
            ForEach(0..<players.count, id: \.self) { index in
                Circle()
                    .foregroundColor(self.players[index].color.swiftUIColor)
                    .frame(width: size, height: size)
                    .offset(y: CGFloat(-index * (Int(size) / 5) ))
                    .shadow(radius: 5)
            }
        }
    }
}
