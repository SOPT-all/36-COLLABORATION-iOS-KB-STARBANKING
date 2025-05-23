//
//  DetailResponse.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/22/25.
//

import Foundation

struct DetailResponse: Decodable {
    let depositCount: Int
    let accountState: String
    let lastTransaction: String
    let contractPeriod: Int
}
