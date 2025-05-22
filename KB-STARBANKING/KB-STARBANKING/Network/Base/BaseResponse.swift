//
//  BaseResponse.swift
//  KB-STARBANKING
//
//  Created by 이세민 on 5/21/25.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let status: Int
    let message: String
    let data: T?
}
