//
//  RateData.swift
//  KB-STARBANKING
//
//  Created by hyunwoo on 5/16/25.
//

import UIKit

struct RateData {
    let title: String
    let image: UIImage
    let rate: String
    let period: String
}

extension RateData {
    static func dummy() -> [RateData] {
        return [
            RateData(title: "KB내맘대로적금장기거래우대이율", image: .imgCard1, rate: "0.1", period: "04.23~10.22"),
            RateData(title: "KB내맘대로적금첫거래우대이율", image: .imgCard2, rate: "0.1", period: "04.23~10.22"),
            RateData(title: "KB소중한날우대이율", image: .imgCard3, rate: "0.1", period: "04.23~10.22")
        ]
    }
}
