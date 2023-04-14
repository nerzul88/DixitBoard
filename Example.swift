//
//  Example.swift
//  Dixit Board
//
//  Created by Андрей Рыбалкин on 13.04.2023.
//

import SwiftUI

struct ContentView: View {
    // Переменная для хранения координат центра круга
    @State private var circleCenter = CGPoint(x: 50, y: 50)
    // Переменная для хранения цвета круга
    @State private var circleColor = Color.brown
    
    @State private var isHidden = true

    
    var body: some View {
        ZStack {
            // Круг, который будет анимироваться
            Circle()
                .fill(circleColor)
                .frame(width: 50, height: 50)
                .position(circleCenter)
                .animation(.easeInOut(duration: 1.0), value: circleCenter)
                .opacity(isHidden ? 0 : 1) // Если круг находится в центре, он видимый
            // Кнопка, при нажатии на которую появится круг
            Button(action: {
                // Генерируем случайные координаты для конечной точки
                let randomX = CGFloat.random(in: 50...300)
                let randomY = CGFloat.random(in: 50...600)
                let endPoint = CGPoint(x: randomX, y: randomY)
                // Присваиваем конечные координаты переменной circleCenter
                circleCenter = endPoint
                isHidden = false
                // Генерируем случайный цвет для круга
                circleColor = Color.brown
                // Через 1.5 секунды после появления круга возвращаем его в начальную точку и делаем его невидимым
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                    circleCenter = CGPoint(x: 50, y: 50)
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isHidden = true
                    }
                }
            }) {
                Text("Show Circle")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
