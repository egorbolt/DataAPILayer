//
//  Order.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import Foundation


public struct Order: Codable {
    public let type: String
    public let id: Int
    public let table: String
    public let guests: Int
    public let date: String
    public let items: [Dish]
    
    enum CodingKeys: String, CodingKey {
        case type = "object"
        case id
        case table
        case guests
        case date
        case items
    }
    
    public var totalPrice: String {
        String(items.map { $0.price }.reduce(0, +)) + " \(items[0].currency)"
    }
}
