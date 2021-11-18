//
//  Till.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import Foundation


public struct Till: Codable {
    public let type: String
    public let orders: [Order]
    
    enum CodingKeys: String, CodingKey {
        case type = "object"
        case orders
    }
}
