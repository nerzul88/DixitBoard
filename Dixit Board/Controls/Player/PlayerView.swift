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
                .foregroundColor(viewModel.player.color.swiftUIColor)
            HStack {
                ZStack {
                    Circle()
                        .foregroundColor(.clear)
                        .addBorder(.white, width: 1, cornerRadius: 25)
                    Text("\(viewModel.player.number)")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .foregroundColor(.white)
                }
                Spacer()
                Text(viewModel.player.name.uppercased())
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding(.trailing)
            }
        }
    }
    
    // MARK: -
    
    var body: some View {
        
        player
            .frame(height: 50)
            .padding(.vertical)
            .scaledToFit()
            .opacity(viewModel.player.isActive ? 1 : 0.75)
        
    }
}
