//
//  InterestRateResponse.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/22/25.
//

import Foundation

struct InterestRateResponse: Decodable {
    let savingAccountName: String
    let accountNumber: String
    let contractPeriod: Int
    let startDate: String
    let endDate: String
    let baseRate: String
    let baseEndDate: String
    let preferentialRates: [PreferentialRate]
}

struct PreferentialRate: Decodable {
    let id: Int
    let name: String
    let rate: String
    let startDate: String
    let endDate: String
}
