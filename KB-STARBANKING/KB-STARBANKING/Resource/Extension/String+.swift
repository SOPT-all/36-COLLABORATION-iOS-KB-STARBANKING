//
//  String+.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/23/25.
//

import Foundation

extension String {
    
    // "yyyy.MM.dd" 형식 → "yy년 M월 d일" 형식
    func toFormattedDate() -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy.MM.dd"
        inputFormatter.locale = Locale(identifier: "ko_KR")
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yy년 M월 d일"
        outputFormatter.locale = Locale(identifier: "ko_KR")
        
        if let date = inputFormatter.date(from: self) {
            return outputFormatter.string(from: date)
        }
        
        return self
    }
    
    // 숫자 문자열에 천 단위 구분 쉼표를 추가
    var decimalFormatted: String {
        guard let number = Int(self) else { return self }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: number)) ?? self
    }
}
