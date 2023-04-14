//
// MenuView.swift
//

import SwiftUI

struct MenuView: View {
    
    // MARK: -
    
    @Environment(\.dismiss) var dismiss
    
    // MARK: -
    
    @StateObject var viewModel: MenuViewModel
    
    @State var showMenu = true
    @State var showSettings = false
    
    // MARK: -
    
    init(viewModel: MenuViewModel = .init()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
        
    @ViewBuilder private var buttons: some View {
        
        VStack {
            
            MenuButtonView(viewModel: .init(title: "Новая игра")) {
                withAnimation {
                    showSettings.toggle()
                }
            }
            
            MenuButtonView(viewModel: .init(title: "Продолжить игру")) {
                // empty.
            }

            MenuButtonView(viewModel: .init(title: "Правила")) {
                // empty.
            }
        }
    }

    
    @ViewBuilder private var mainView: some View {
        
        ZStack {
            
            GeometryReader { proxy in
                Image("wild")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(
                    width: proxy.size.width,
                    height: proxy.size.height
                )
            }

            VStack {
                
                Spacer()
                
                Image("dixit-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                
                Spacer()
                
                if showMenu {
                    buttons
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 32)
            
        }
        .ignoresSafeArea()
    }
        
    // MARK: - body
    
    var body: some View {
        ZStack {
            mainView
                .blur(radius: showSettings ? 25 : 0)
            
            if showSettings {
                SetupView(showSetup: $showSettings)
                    .background(Color.black.opacity(showSettings ? 0.5 : 0))
            }
        }
    }
}

struct Examplezx_Preview: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
