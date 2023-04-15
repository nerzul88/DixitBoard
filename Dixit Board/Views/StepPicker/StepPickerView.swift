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
                                    
                Text("Количество шагов:")
                    .foregroundColor(Color(Colors.actor))
                    .font(.system(size: 24))
                    .bold()
                    
                Picker("", selection: $viewModel.stepsCount) {
                    ForEach(1..<viewModel.playersCount + 2) { count in
                            Text("\(count)").tag(count)
                                .foregroundColor(Color(Colors.actor))
                                .bold()
                        }
                    }
                    .pickerStyle(.wheel)
                    .scaledToFit()
                
                MenuButtonView(viewModel: .init(title: "Ход"), handler: {
                    onStepBlock?(viewModel.stepsCount)
                    showPicker.toggle()
                })
                
                MenuButtonView(viewModel: .init(title: "Отмена"), handler: {
                    showPicker.toggle()
                })

            }
            .padding(.horizontal, 32)
            .padding()
        }
        .scaledToFit()
    }
    
    // MARK: -
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.25)
            
            pickerView
                .padding()
        }
        .ignoresSafeArea()
    }
}

struct Examplexfsfv_Preview: PreviewProvider {
    static var previews: some View {
        
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

            StepPickerView(viewModel: .init(oldSector: 3, name: "TEST", color: .init(Colors.color_0), playersCount: 3), showPicker: .constant(true))
        }
        
    }
}
