//
//  UIColor+.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/13/25.
//

import UIKit

enum KBColor: String {

    case black = "Black"
    case white = "White"

    case gr1 = "GR1"
    case gr2 = "GR2"
    case gray1 = "Gray1"
    case gray2 = "Gray2"
    case gray3 = "Gray3"
    case gray4 = "Gray4"
    case gray5 = "Gray5"
    case gray6 = "Gray6"
    case gray7 = "Gray7"
    case gray8 = "Gray8"
    case gray9 = "Gray9"

    case blue1 = "Blue1"
    case blue2 = "Blue2"
    case blue3 = "Blue3"
    case yellow1 = "Yellow1"
    case yellow2 = "Yellow2"
    case yellow3 = "Yellow3"
}

extension UIColor {
    static func color(_ color: KBColor) -> UIColor {
        return UIColor(named: color.rawValue) ?? .clear
    }
}
