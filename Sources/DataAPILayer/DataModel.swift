//
//  File.swift
//  
//
//  Created by Egor Boldyrev on 18.11.2021.
//

import Foundation

public protocol DataModelType {
    func makeDataModel(completion: @escaping (Result<Till, Error>) -> ())
}

public final class DataModel: DataModelType {
    private let api: DataAPIType
    
    public init(api: DataAPIType) {
        self.api = api
    }
    
    public func makeDataModel(completion: @escaping (Result<Till, Error>) -> ()) {
        return api.getData(of: Till.self, httpMethod: .get) { result in
            completion(result)
        }
    }
}
