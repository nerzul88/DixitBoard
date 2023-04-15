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
        return UIScreen.main.bounds.width / 14
    }
    
    static var sectorWidth: CGFloat {
        return Sizes.sectorRadius * 2
    }
    
    static var arrowMargin: CGFloat {
        return Sizes.sectorRadius / 5
    }

}
