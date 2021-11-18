//
//  MenuItem.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import Foundation


public struct Dish: Codable {
    public let type: String
    public let id: Int
    public let name: String
    public let price: Int
    public let currency: String
    public let color: String
    
    enum CodingKeys: String, CodingKey {
        case type = "object"
        case id
        case name
        case price
        case currency
        case color
    }
}
