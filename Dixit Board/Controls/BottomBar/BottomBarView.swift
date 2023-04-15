//
//  BottomBarView.swift
//

import SwiftUI

struct BottomBarView: View {
    
    // MARK: - Internal state object var
    
    @ObservedObject var viewModel: BottomBarViewModel
    
    // MARK: - Internal init
    
    init(viewModel: BottomBarViewModel, onSelectPlayerBlock: ((Int) -> Void)? = nil) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        self.onSelectPlayerBlock = onSelectPlayerBlock
    }
    
    // MARK: -

    var onSelectPlayerBlock: ((Int) -> Void)?
    
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
            
            VStack(spacing: 16) {
                Text("Players: \(viewModel.players.count)".uppercased())
                    .font(.system(size: 32, weight: .bold, design: .default))
                    .foregroundColor(Color("actor"))
                    .padding(.top)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer()
                        ForEach(Array(viewModel.players.enumerated()), id: \.element.number) { index, player in
                            PlayerView(viewModel: .init(player: player))
                                .onTapGesture {
                                    onSelectPlayerBlock?(index)
                                }
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

struct Exampldede_Preview: PreviewProvider {
    static var previews: some View {
        BottomBarView(viewModel: .init(players: MockData.players))
    }
}
