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
    @State var canAddPlayers = true
    @State var canStartGame = false
    
    // MARK: -
    
    @Binding var showSetup: Bool
    @Binding var showGame: Bool

    // MARK: -
    
    init(
        viewModel: SetupViewModel,
        showSetup: Binding<Bool>,
        showGame: Binding<Bool>
    ) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        self._showSetup = showSetup
        self._showGame = showGame
    }
    
    // MARK: -

    @ViewBuilder private var setupView: some View {
        
        ZStack {
            Color(Colors.main)
                .cornerRadius(64)
                .overlay(
                    RoundedRectangle(cornerRadius: 64)
                        .stroke(Color(Colors.actor), lineWidth: 8)
                )
            
            VStack {
                ZStack {
                    HStack(alignment: .center) {
                        
                        Spacer()
                        
                        Button {
                            showSetup.toggle()
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(Color(Colors.actor))
                                .frame(width: 32, height: 32)
                        }
                    }
                    .padding(.horizontal)
                    Text("Игроки")
                        .font(.system(size: 36)).bold()
                        .foregroundColor(Color(Colors.actor))
                    
                }
                
                Text("Добавьте от 3 до 10 игроков")
                    .font(.title3)
                    .foregroundColor(Color(Colors.actor))
                    .lineLimit(1)

                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(Array(viewModel.players.enumerated()), id: \.element.number) { index, player in
                        
                        HStack {
                            
                            ZStack {
                                
                                Circle()
                                    .foregroundColor(Color(player.color))
                                    .addBorder(Color(Colors.actor), width: 2, cornerRadius: 25)
                                    .frame(width: 50
                                    )
                                
                                Text("\(index + 1)")
                                    .font(.system(size: 25, weight: .bold, design: .default))
                                    .foregroundColor(Color(Colors.actor))
                            }

                            Text("\(player.name.uppercased())")
                                .font(.system(size: 25, weight: .bold, design: .default))
                                .foregroundColor(Color(Colors.actor))
                            
                            Spacer()
                            
                            Button {
                                    viewModel.players.remove(at: index)
                            } label: {
                                Image(systemName: "trash.circle")
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .foregroundColor(Color(Colors.actor))
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                
                Spacer()
                
                MenuButtonView(viewModel: .init(title: "Добавить игрока", icon: "plus")) {
                    withAnimation {
                        showPicker.toggle()
                    }
                }
                .disabled(!canAddPlayers)
                .opacity(canAddPlayers ? 1 : 0.5)

                MenuButtonView(viewModel: .init(title: "Начать игру")) {
                    
                    withAnimation() {
                        showGame.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        showSetup.toggle()
                    }
                    
                }
                .disabled(!canStartGame)
                .opacity(canStartGame ? 1 : 0.5)
                
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
                .onChange(of: viewModel.players) { players in
                    canAddPlayers = players.count < 10
                    canStartGame = players.count >= 3
                }
            
            if showPicker {
                
                let expected = (viewModel.players.last?.number ?? 0) + 1
                
                PickerView(viewModel: .init(expectedNumber: expected, avaiableColors: viewModel.availableColors), showPicker: $showPicker, onAddPlayerBlock: { player in
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
        SetupView(viewModel: .init(players: .constant([])), showSetup: .constant(true), showGame: .constant(false) )
    }
}
