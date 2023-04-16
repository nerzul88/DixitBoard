//
// PlayerView.swift
//

import SwiftUI

struct PlayerView: View {
    
    // MARK: - Internal state object var
    
    @ObservedObject var viewModel: PlayerViewModel
    
    // MARK: - Internal init
    
    init(viewModel: PlayerViewModel) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    // MARK: - Internal var
    
    @ViewBuilder private var player: some View {
        ZStack {
            Capsule(style: .circular)
                .foregroundColor(Color(Colors.main))
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(Color(viewModel.player.color))
                        .addBorder(Color(Colors.main), width: 2, cornerRadius: 25)
                    Text("\(viewModel.player.sector)")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .foregroundColor(Color(Colors.actor))
                }
                Spacer()
                Text(viewModel.player.name.uppercased())
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .foregroundColor(Color(Colors.actor))
                    .padding(.trailing)
                    .lineLimit(1)
            }
        }
    }
    
    // MARK: -
    
    var body: some View {
        
        player
            .frame(height: viewModel.height)
            .scaledToFit()
        
    }
}

struct Examplezxq_Preview: PreviewProvider {
    static var previews: some View {
        PlayerView(viewModel: .init(player: MockData.players[7]))
    }
}
