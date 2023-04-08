//
// PlayersBottomView.swift
//

import SwiftUI

struct PlayersBottomView: View {
    
    // MARK: - Internal state object var
    
    @ObservedObject var viewModel: PlayersBottomViewModel
    
    // MARK: - Internal init
    
    init(viewModel: PlayersBottomViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    // MARK: - Internal var
    
    @ViewBuilder private var players: some View {
        ZStack {
            Color.clear
                .background(
                    RoundedCornersShape(
                        corners: [.topLeft, .topRight],
                        radius: 48
                    )
                    .fill(Color.white)
                )
            
            VStack(spacing: 0) {
                Text("Players: \(viewModel.players.count)".uppercased())
                    .font(.system(size: 32, weight: .bold, design: .default))
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer()
                        ForEach(viewModel.players, id: \.number) {
                            PlayerView(viewModel: .init(player: $0))
                        }
                        Spacer()
                    }
                }
                Spacer()
            }
        }
    }
    
    
    var body: some View {
        players
            .frame(height: 180)
        //            .shadow(color: .black.opacity(0.25), radius: 25, x: 0, y: -15)
    }
}

// MARK: -
// MARK: -
// MARK: -


struct Example2_Preview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            
            VStack {
                Spacer()
                
                PlayersBottomView(viewModel: .init(players: [
                    Player(name: "Andrey", color: .init(color: .indigo), number: 1, position: 0, isActive: true),
                    Player(name: "Alex", color: .init(color: Color.orange), number: 2, position: 12, isActive: false),
                    Player(name: "Julia", color: .init(color: Color.green), number: 3, position: 0, isActive: true),
                    Player(name: "Arseniy Rybalkin", color: .init(color: Color.mint), number: 4, position: 12, isActive: false)
                ]))
            }
        }
        .ignoresSafeArea()
    }
}
