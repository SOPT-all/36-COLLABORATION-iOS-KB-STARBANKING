//
//  UIFont+.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/12/25.
//

import UIKit

enum KBFont {
    
    case title1_24_semibold
    case title1_24_light
    case title2_18_bold
    case title2_18_semibold
    case title2_18_light
    
    case subtitle1_18_light
    
    case body1_16_semibold
    case body1_16_light
    case body2_15_semibold
    case body2_15_regular
    case body2_15_light
    case body3_14_light
    case body3_14_medium
    
    case caption1_13_light
    case caption2_12_light
    case caption3_11_medium
    
    var fontSize: CGFloat {
        switch self {
        case .title1_24_semibold, .title1_24_light: return 24
        case .title2_18_bold, .title2_18_semibold, .title2_18_light, .subtitle1_18_light: return 18
        case .body1_16_semibold, .body1_16_light: return 16
        case .body2_15_semibold, .body2_15_regular, .body2_15_light: return 15
        case .body3_14_light, .body3_14_medium: return 14
        case .caption1_13_light: return 13
        case .caption2_12_light: return 12
        case .caption3_11_medium: return 11
        }
    }
    
    // Bold: 700, Semibold: 600, Medium: 500, Regular: 400, Light: 300
    var fontWeight: String {
        switch self {
        case .title2_18_bold:
            return "Pretendard-Bold"
        case .title1_24_semibold, .title2_18_semibold, .body1_16_semibold, .body2_15_semibold:
            return "Pretendard-Semibold"
        case .body3_14_medium, .caption3_11_medium:
            return "Pretendard-Medium"
        case .body2_15_regular:
            return "Pretendard-Regular"
        case .title1_24_light, .title2_18_light, .subtitle1_18_light, .body1_16_light, .body2_15_light, .body3_14_light, .caption1_13_light, .caption2_12_light:
            return "Pretendard-Light"
        }
    }
}

extension UIFont {
    static func font(_ font: KBFont) -> UIFont {
        return UIFont(name: font.fontWeight, size: font.fontSize) ?? UIFont.systemFont(ofSize: font.fontSize)
    }
}
