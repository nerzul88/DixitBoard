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
    
    var body: some View {
        
        player
            .frame(height: 50)
            .padding(.vertical)
            .scaledToFit()
//            .border(.blue)
            .opacity(viewModel.player.isActive ? 1 : 0.75)
        
    }
}

// MARK: -
// MARK: -
// MARK: -

struct Example_Preview: PreviewProvider {
    static var previews: some View {
        
        ScrollView(.horizontal) {
            
            HStack {
                
                PlayerView(viewModel: PlayerViewModel(player: Player(name: "Andrey", color: .init(color: .indigo), number: 1, position: 0, isActive: true)))
                
                PlayerView(viewModel: PlayerViewModel(player: Player(name: "Alex", color: .init(color: Color.orange), number: 2, position: 0, isActive: false)))
                                
                Spacer()
            }
        }
    }
    
}
