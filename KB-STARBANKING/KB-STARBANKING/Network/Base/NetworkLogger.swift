//
//  NetworkLogger.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/21/25.
//


import Foundation

final class NetworkLogger {
    static let shared = NetworkLogger()
    private init() { }
    
    func responseLog(_ response: HTTPURLResponse, data: Data) {
        print("Response")
        print("Status Code: \(response.statusCode)")
        print("Headers: \(response.allHeaderFields)")
        
        if let responseBody = String(data: data, encoding: .utf8) {
            print("Body: \(responseBody)")
        } else {
            print("Body is not UTF-8 decodable")
        }
        
        print("===========================")
    }
}
