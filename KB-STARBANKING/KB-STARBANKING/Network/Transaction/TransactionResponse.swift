//
//  TransactionResponse.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/22/25.
//

import Foundation

struct TransactionResponse: Decodable {
    let savingAccountName: String
    let accountNumber: String
    let totalBalance: Int
    let startDate: String
    let endDate: String
    let dDay: String
    let preferentialRate: String
    let maxAppliedRate: String
    let deposits: [Deposits]
}

struct Deposits: Decodable {
    let id: Int
    let count: Int
    let depositDate: String
    let payment: Int
    let afterPaymentBalance: Int
    let appliedRate: String
}
