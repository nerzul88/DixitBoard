//
//  Size.swift
//  Dixit Board
//
//  Created by Aleksandr Kasianov on 09.04.2023.
//

import Foundation
import UIKit

final class Sizes {
    
    static var sectorRadius: CGFloat {
        
        switch UIDevice.current.userInterfaceIdiom {
            
        case .phone:
            return UIScreen.main.bounds.width / 14
            
        default:
            return UIScreen.main.bounds.width / 18
        }
    }
    
    static var sectorWidth: CGFloat {
        return Sizes.sectorRadius * 2
    }
    
    static var arrowMargin: CGFloat {
        return Sizes.sectorRadius / 5
    }
    
    static var arrowSize: CGFloat {
        return UIDevice.current.userInterfaceIdiom == .phone ? 10 : 15
    }


}

enum UIUserInterfaceIdiom: Int {
    case unspecified
    case phone // iPhone and iPod touch style UI
    case pad   // iPad style UI (also includes macOS Catalyst)
}
