//
//  BottomBarView.swift
//

import SwiftUI

struct BottomBarView: View {
    
    // MARK: - Internal state object var
    
    @ObservedObject var viewModel: BottomBarViewModel
    
    // MARK: - Internal init
    
    init(viewModel: BottomBarViewModel) {
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
            .shadow(color: .black.opacity(0.15), radius: 10, x: 0, y: -10)
    }
}
