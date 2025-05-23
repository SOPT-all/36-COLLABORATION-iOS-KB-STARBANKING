//
//  TotalAccountService.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/23/25.
//

import Foundation

final class TotalAccountService {
    static let shared = TotalAccountService()
    private init() {}
    
    func fetchTotalAccount() async throws -> TotalAccountResponse {
        do {
            let response: TotalAccountResponse = try await BaseService.shared.request(endPoint: .fetchAccount)
            return response
        } catch {
            throw error
        }
    }
}
