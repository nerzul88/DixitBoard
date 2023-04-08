//
//  ContentView.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 08.04.2023.
//

import SwiftUI

struct ContentView: View {
            
    var body: some View {
        SectorView(viewModel: SectorViewModel(sector: Sector(circleRadius: UIScreen.main.bounds.width * 0.074, arrowDirection: 180, arrowMargin: 0, number: 35), players: []))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            
            ContentView()
//                .frame(width: 75, height: 75, alignment: .center)
                .border(.blue)
            }
        }
}
