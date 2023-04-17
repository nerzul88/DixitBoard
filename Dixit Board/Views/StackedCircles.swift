//
//  StackedCircles.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 08.04.2023.
//

import SwiftUI

struct StackedCircles: View {
    
    // MARK: -

    @Binding var players: [Player]
    
    // MARK: -

    @State var size: CGFloat
    @State var sector: Int
    
    // MARK: -
    
    init(players: Binding<[Player]>, size: CGFloat, sector: Int) {
        self._players = players
        self.size = size
        self.sector = sector
    }
    
    // MARK: -

    var body: some View {
        ZStack {
            
            ForEach(Array(players.filter{ $0.sector == self.sector }.enumerated()), id: \.element.number) { index, player in
                    Circle()
                        .foregroundColor(Color(player.color))
                        .frame(width: size, height: size)
                        .offset(y: CGFloat(-index * (Int(size) / 5) ))
                        .shadow(radius: 1)
            }
        }
    }
}
