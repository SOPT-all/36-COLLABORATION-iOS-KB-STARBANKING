//
//  BaseService.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/21/25.
//

import Foundation

final class BaseService {
    static let shared = BaseService()
    private init() { }
    
    func request<Response: Decodable>(
        endPoint: EndPoint
    ) async throws -> Response {
        // URL 구성
        let urlString = Config.baseURL + endPoint.url
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        // Request 준비
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        endPoint.header.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        // network 호출
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknownError
        }
        
        NetworkLogger.shared.responseLog(httpResponse, data: data)
        
        // 상태 코드 체크
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.internalServerError
        }
        
        // 디코딩
        do {
            let decoded = try JSONDecoder().decode(BaseResponse<Response>.self, from: data)
            
            guard let data = decoded.data else {
                throw NetworkError.noData
            }
            
            return data
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
}
