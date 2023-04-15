//
// StepPickerView.swift
//

import SwiftUI

struct StepPickerView: View {
    
    // MARK: -
    
    @Environment(\.dismiss) var dismiss
    
    // MARK: -
    
    @ObservedObject var viewModel: StepPickerViewModel
    
    // MARK: -
    
    @Binding var showPicker: Bool
    
    // MARK: -
    
    init(viewModel: StepPickerViewModel, showPicker: Binding<Bool>, onStepBlock: ((Int) -> Void)? = nil) {
        self._viewModel = ObservedObject(wrappedValue: viewModel)
        self._showPicker = showPicker
        self.onStepBlock = onStepBlock
    }
    
    // MARK: -
    
    var onStepBlock: ((Int) -> Void)?
    
    // MARK: - ViewBuilder var
    
    @ViewBuilder private var pickerView: some View {
        ZStack {
            Color(Colors.main)
                .cornerRadius(64)
                .overlay(
                    RoundedRectangle(cornerRadius: 64)
                        .stroke(Color(Colors.actor), lineWidth: 8)
                )
            
            VStack(spacing: 16) {
                Text("\(Image(systemName: "circle.fill")) \(viewModel.name)")
                    .foregroundColor(Color(viewModel.color))
                    .font(.system(size: 36))
                    .bold()
                
                    
                Text("Текущая позиция: \(viewModel.oldSector)")
                    .foregroundColor(Color(Colors.actor))
                    .font(.system(size: 24))
                    .bold()
                                    
                Text("Новая позиция:")
                    .foregroundColor(Color(Colors.actor))
                    .font(.system(size: 24))
                    .bold()
                    
                Picker("", selection: $viewModel.newSector) {
                        ForEach(0..<31) { sector in
                            Text("\(sector)").tag(sector)
                                .bold()
                        }
                    }
                    .pickerStyle(.wheel)
                    .scaledToFit()
                    
                MenuButtonView(viewModel: .init(title: "Ход"), handler: {
                    
                    onStepBlock?(viewModel.newSector)
                    
                    withAnimation {
                        showPicker.toggle()
                    }
                })
            }
            .scaledToFit()
            .padding(.horizontal, 32)
            .padding()
        }
    }
    
    // MARK: -
    
    var body: some View {
        pickerView
            .padding()
            .scaledToFit()
    }
}

struct Examplexfsfv_Preview: PreviewProvider {
    static var previews: some View {
        StepPickerView(viewModel: .init(oldSector: 3, name: "TEST", color: .init(Colors.color_0)), showPicker: .constant(true))
        
    }
}
