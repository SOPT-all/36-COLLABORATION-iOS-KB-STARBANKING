//
//  DetailService.swift
//  KB-STARBANKING
//
//  Created by 신혜연 on 5/23/25.
//

import Foundation

final class DetailService {
    static let shared = DetailService()
    private init() {}
    
    func fetchDetail(accountId: Int) async throws -> DetailResponse {
        do {
            let response: DetailResponse = try await BaseService.shared.request(endPoint: .fetchDetail(accountId))
            return response
        } catch {
            throw error
        }
    }
}
