//
//  TransactionService.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/22/25.
//

import Foundation

final class TransactionService {
    static let shared = TransactionService()
    private init() { }
    
    func fetchTransaction(accountId: Int) async throws -> TransactionResponse {
        do {
            let response: TransactionResponse = try await BaseService.shared.request(endPoint: .fetchTransaction(accountId))
            return response
        } catch {
            throw error
        }
    }
}
