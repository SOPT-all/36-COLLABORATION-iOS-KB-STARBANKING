//
//  InterestRateService.swift
//  KB-STARBANKING
//
//  Created by hyunwoo on 5/23/25.
//

import Foundation

final class InterestRateService {
    static let shared = InterestRateService()
    private init() {}
    
    func fetchInterestRate(accountId: Int) async throws -> InterestRateResponse {
        do{
            let response: InterestRateResponse = try await BaseService.shared.request(endPoint: .fetchInterestRate(accountId))
            return response
        } catch {
            throw error
        }
    }
}
