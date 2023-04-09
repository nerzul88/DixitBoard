//
//  Dixit_BoardApp.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 08.04.2023.
//

import SwiftUI

@main
struct Dixit_BoardApp: App {
    var body: some Scene {
        WindowGroup {
            GameView(viewModel: .init())
        }
    }
}
