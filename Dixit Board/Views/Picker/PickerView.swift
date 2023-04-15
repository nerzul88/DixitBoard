//
// PickerView.swift
//

import SwiftUI

struct PickerView: View {
    
    // MARK: -
    
    @Environment(\.dismiss) var dismiss
    
    // MARK: -
    
    @ObservedObject var viewModel: PickerViewModel
    
    // MARK: -
    
    @Binding var showPicker: Bool
    
    // MARK: -
    
    init(viewModel: PickerViewModel, showPicker: Binding<Bool>, onAddPlayerBlock: ((Player) -> Void)? = nil) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        self._showPicker = showPicker
        self.onAddPlayerBlock = onAddPlayerBlock
    }
    
    // MARK: -
    
    var onAddPlayerBlock: ((Player) -> Void)?
    
    // MARK: - ViewBuilder var
    
    @ViewBuilder private var pickerView: some View {
        ZStack {
            Color("main")
                .cornerRadius(64)
                .overlay(
                    RoundedRectangle(cornerRadius: 64)
                        .stroke(Color("actor"), lineWidth: 8)
                )
            
            VStack {
                HStack {
                    Text("Введите имя")
                        .foregroundColor(Color("actor"))
                        .font(.title)
                        .bold()
                }
                
                VStack {
                    
                    TextField("", text: $viewModel.newPlayerName)
                        .foregroundColor(Color("actor"))
                        .font(.title)
                    
                    Rectangle()
                        .frame(height: 2)
                }
                
                Picker("", selection: $viewModel.newPlayerColor) {
                    ForEach(0..<10) { index in
                        let color = Storage.shared.colors[index]
                        Text("\(Image(systemName: "circle.fill"))").tag(color.swiftUIColor)
                            .foregroundColor(color.swiftUIColor)
                        }
                    }
                .pickerStyle(.wheel)
                .frame(height: 100)
                    .scaledToFit()
                
                MenuButtonView(viewModel: .init(title: "Готово"), handler: {
                    
                    withAnimation {
                        
                        onAddPlayerBlock? (
                            Player(
                                name: viewModel.newPlayerName,
                                color: .init(color: viewModel.newPlayerColor),
//                                color: .init(color: .init(viewModel.newPlayerColor!)),
                                number: viewModel.expectedNumber,
                                sector: 0,
                                position: .zero)
                        )
                        
                        showPicker.toggle()
                    }
                })
                .padding(.horizontal, 32)
                .disabled(!viewModel.canAddPlayer)
                .opacity(viewModel.canAddPlayer ? 1 : 0.5)

            }
            .scaledToFit()
            .padding()
        }
    }
    
    // MARK: -
    
    var body: some View {
        pickerView
            .scaledToFit()
    }
}

struct Examplesfv_Preview: PreviewProvider {
    static var previews: some View {
        PickerView(viewModel: .init(expectedNumber: 1), showPicker: .constant(true))
        
    }
}
