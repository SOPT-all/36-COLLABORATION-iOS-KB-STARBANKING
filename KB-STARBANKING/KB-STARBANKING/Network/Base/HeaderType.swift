//
//  HeaderType.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/21/25.
//

import Foundation

enum HeaderType {
    case auth
    case none
    
    var type: [String: String] {
        switch self {
        case .auth:
            [
                "Content-Type": "application/json",
                "account-id": "1"
            ]
        case .none:
            ["Content-Type": "application/json"]
        }
    }
}
