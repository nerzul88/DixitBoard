//
// MenuButtonView.swift
//

import SwiftUI

struct MenuButtonView: View {
    
    // MARK: -
    
    @Environment(\.dismiss) var dismiss
    
    // MARK: -
    
    @ObservedObject var viewModel: MenuButtonViewModel
    
    // MARK: -
    
    init(viewModel: MenuButtonViewModel, handler: (() -> Void)?) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        self.handler = handler
    }
    
    // MARK: -

    var handler: (() -> Void)?

    // MARK: - ViewBuilder var
    
    @ViewBuilder var menuButton: some View {
        
        Button {
            handler?()
        } label: {
            ZStack {
                Capsule()
                    .foregroundColor(Color("main").opacity(0.5))
                    .overlay(
                        RoundedRectangle(cornerRadius: 35)
                            .stroke(Color("actor"), lineWidth: 4)
                    )
                    .padding(4)

                HStack {
                    
                    if let icon = viewModel.icon {
                        Image(systemName: icon)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color("actor"))
                    }
                    
                    Text(viewModel.title)
                        .font(.title).bold()
                        .foregroundColor(Color("actor"))
                        .scaledToFit()
                }
            }
            .frame(height: 75)
        }
    }

    
    // MARK: -
    
    var body: some View {
        menuButton
    }
}
