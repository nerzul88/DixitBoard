//
// SetupView.swift
//

import SwiftUI

struct SetupView: View {
    
    // MARK: -
    
    @Environment(\.dismiss) var dismiss
    
    // MARK: -
    
    @ObservedObject var viewModel: SetupViewModel
    
    // MARK: -
    
    @State var showPicker = false
    
    // MARK: -
    
    @Binding var showSetup: Bool

    // MARK: -
    
    init(viewModel: SetupViewModel = .init(), showSetup: Binding<Bool>) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        self._showSetup = showSetup
    }
    
    
    @ViewBuilder private var setupView: some View {
        
        ZStack {
            Color("main")
                .cornerRadius(64)
                .overlay(
                    RoundedRectangle(cornerRadius: 64)
                        .stroke(Color("actor"), lineWidth: 8)
                )
            
            VStack {
                ZStack {
                    HStack(alignment: .center) {
                        
                        Spacer()
                        
                        Button {
                            showSetup.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(Color("actor"))
                                .frame(width: 32, height: 32)
                                .rotationEffect(.degrees(45))
                        }
                    }
                    .padding(.horizontal)
                    Text("Игроки")
                        .font(.system(size: 36)).bold()
                        .foregroundColor(Color("actor"))
                    
                }
                
                Text("Добавьте от 3 до 10 игроков")
                    .font(.title3)
                    .foregroundColor(Color("actor"))
                    .lineLimit(1)

                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(Array(viewModel.players.enumerated()), id: \.element.number) { index, player in
                        
                        HStack {
                            PlayerView(viewModel: .init(player: player))
                                .scaledToFit()
                            
                            Spacer()
                            Button {
                                    viewModel.players.remove(at: index)
                            } label: {
                                Image(systemName: "trash.circle")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .foregroundColor(Color("actor"))
                            }
                        }
                    }
                }
                
                Spacer()
                
                MenuButtonView(viewModel: .init(title: "Добавить игрока", icon: "plus")) {
                    withAnimation {
                        showPicker.toggle()
                    }
                }
                .disabled(!viewModel.canAddPlayers)
                .opacity(viewModel.canAddPlayers ? 1 : 0.5)

                MenuButtonView(viewModel: .init(title: "Начать игру")) {
                    //empty.
                }
                .disabled(!viewModel.canStartGame)
                .opacity(viewModel.canStartGame ? 1 : 0.5)
                
            }
            
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 32)
        }
        .ignoresSafeArea()
        .padding(.horizontal, 16)
        .padding(.vertical, 32)
    }

    
    // MARK: -
    
    var body: some View {
        ZStack {
            setupView
            
            if showPicker {
                PickerView(viewModel: .init(newPlayerName: "Andrey", newPlayerColor: .blue, expectedNumber: viewModel.players.count + 1), showPicker: $showPicker, onAddPlayerBlock: { player in
                    viewModel.players.append(player)
                })
                    .frame(maxHeight: .infinity)
                    .background(Color.black.opacity(showPicker ? 0.5 : 0))
            }
        }
    }
}

struct Exampleqev_Preview: PreviewProvider {
    static var previews: some View {
        SetupView(viewModel: .init(), showSetup: .constant(true) )
    }
}
