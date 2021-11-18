//
//  DataAPIError.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

public enum DataAPIError: Error {
    case getDataError
    case wrongURL
    case wrongDecoding
}

extension DataAPIError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .getDataError:
            return "There's problem with fetching data from network."
            
        case .wrongURL:
            return "Check your initial URL."
            
        case .wrongDecoding:
            return "Something went wrong with decoding."
        }
    }
}
