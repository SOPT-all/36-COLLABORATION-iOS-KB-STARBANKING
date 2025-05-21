//
//  EndPoint.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/21/25.
//

import Foundation

enum EndPoint {
    case fetchAccount // 뷰1
    case fetchTransaction(Int) // 뷰2
    case fetchDetail(Int) // 뷰3
    case fetchInterestRate(Int) // 뷰4
    
    var url: String {
        switch self {
        case .fetchAccount:
            return "/api/v1/accounts"
        case .fetchTransaction(let accountId):
            return "/api/v1/accounts/\(accountId)"
        case .fetchDetail(let accountId):
            return "/api/v1/accounts/\(accountId)/state"
        case .fetchInterestRate(let accountId):
            return "/api/v1/accounts/\(accountId)/rates"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .fetchAccount:
            HeaderType.none.type
        case .fetchTransaction, .fetchDetail, .fetchInterestRate:
            HeaderType.auth.type
        }
    }
}
