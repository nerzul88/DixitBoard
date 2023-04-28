//
// WinnerView.swift
//

import SwiftUI

enum GameMode {
    case `continue`
    case new
    case close
}

struct WinnerView: View {
    
    // MARK: -

    var name: String
        
    // MARK: -
    
    @Binding var showWinner: Bool
    
    // MARK: -
    
    init(name: String, showWinner: Binding<Bool>, onContinueBlock: ((GameMode) -> Void)? = nil) {
        self.name = name
        self._showWinner = showWinner
        self.onContinueBlock = onContinueBlock
    }
    
    // MARK: -
    
    var onContinueBlock: ((GameMode) -> Void)?
    
    // MARK: -
    
    @ViewBuilder private var winnerView: some View {
        ZStack {
            Color(Colors.main)
                .cornerRadius(64)
                .overlay(
                    RoundedRectangle(cornerRadius: 64)
                        .stroke(Color(Colors.actor), lineWidth: 8)
                )
            
            VStack(spacing: 8) {
                
                Text("\"\(name)\"")
                    .foregroundColor(Color(Colors.actor))
                    .font(.system(size: 28))
                    .bold()
                
                Text("Заканчивает круг")
                    .foregroundColor(Color(Colors.actor))
                    .font(.system(size: 18))
                    .bold()
                                
                Rectangle()
                    .foregroundColor(Color(Colors.actor))
                    .frame(height: 2)

                Text("Продолжить игру?")
                    .foregroundColor(Color(Colors.actor))
                    .font(.system(size: 18))
                    .bold()
                    .padding()
                                                    
                MenuButtonView(viewModel: .init(title: "Продолжить"), handler: {
                    onContinueBlock?(.`continue`)
                })
                
                MenuButtonView(viewModel: .init(title: "Закончить"), handler: {
                    onContinueBlock?(.close)
                })

                MenuButtonView(viewModel: .init(title: "Начать заново"), handler: {
                    onContinueBlock?(.new)
                })
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
