//
// WinnerView.swift
//

import SwiftUI

struct GameOverView: View {
    
    // MARK: -
    
    var names: [String]
    
    // MARK: -
    
    @Binding var showGameOver: Bool
    
    // MARK: -
    
    init(names: [String], showGameOver: Binding<Bool>, onContinueBlock: ((GameMode) -> Void)? = nil) {
        self.names = names
        self._showGameOver = showGameOver
        self.onContinueBlock = onContinueBlock
    }
    
    // MARK: -
    
    var onContinueBlock: ((GameMode) -> Void)?
    
    // MARK: - ViewBuilder var
    
    @ViewBuilder private var winnerView: some View {
        ZStack {
            Color(Colors.main)
                .cornerRadius(64)
                .overlay(
                    RoundedRectangle(cornerRadius: 64)
                        .stroke(Color(Colors.actor), lineWidth: 8)
                )
            
            VStack(spacing: 8) {
                
                Text("Поздравляем!")
                    .foregroundColor(Color(Colors.actor))
                    .font(.system(size: 24))
                    .bold()
                
                Text("\(names.count > 1 ? "Победили игроки:" : "Победил игрок:")")
                    .foregroundColor(Color(Colors.actor))
                    .font(.system(size: 24))
                    .bold()
                
                ForEach(names, id: \.self) { name in
                    Text("\(name)")
                        .foregroundColor(Color(Colors.actor))
                        .font(.system(size: 32))
                        .bold()
                }
                
                
                Rectangle()
                    .foregroundColor(Color(Colors.actor))
                    .frame(height: 2)
                
                Text("Начать заново?")
                    .foregroundColor(Color(Colors.actor))
                    .font(.system(size: 24))
                    .bold()
                    .padding()
                
                HStack {
                    
                    MenuButtonView(viewModel: .init(title: "Да"), handler: {
                        onContinueBlock?(.new)
                    })
                    
                    MenuButtonView(viewModel: .init(title: "Нет"), handler: {
                        onContinueBlock?(.close)
                    })
                }
            }
            .padding(.horizontal, 32)
            .padding()
        }
    }
    
    // MARK: -
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.25)
            
            winnerView
                .padding()
                .scaledToFit()
            
        }
        .ignoresSafeArea()
    }
}
