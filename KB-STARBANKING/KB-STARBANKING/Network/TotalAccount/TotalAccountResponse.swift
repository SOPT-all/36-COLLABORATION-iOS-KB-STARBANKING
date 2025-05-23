//
//  TotalAccountResponse.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/22/25.
//

import Foundation

struct TotalAccountResponse: Decodable {
    let status: Int
    let message: String
    let data: TotalAccountData
}

struct TotalAccountData: Decodable {
    let totalAccountBalance: Int
    let accounts: [Account]
}

struct Account: Decodable {
    let id: Int
    let name: String
    let accountNumber: String
    let startDate: String
    let endDate: String
    let dDay: String
    let accountBalance: Int
}
