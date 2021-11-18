//
//  DataAPI.swift
//  PopinaDemo
//
//  Created by Egor Boldyrev on 17.11.2021.
//

import Foundation

public protocol DataAPIType {
    func getData<ReturnType: Codable>(
        of type: ReturnType.Type,
        httpMethod: HTTPMethod,
        completion: @escaping (Result<ReturnType, Error>) -> ()
    )
}

public final class DataAPI: DataAPIType {
    private let initialURL: String
    
    public init(initialURL: String) {
        self.initialURL = initialURL
    }
    
    public func getData<ReturnType: Codable>(
        of type: ReturnType.Type,
        httpMethod: HTTPMethod,
        completion: @escaping (Result<ReturnType, Error>) -> ()
    ) {
        guard let url = URL(string: initialURL) else {
            completion(.failure(DataAPIError.wrongURL))
            return
        }
        
        DispatchQueue.global().async {
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod.rawValue
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(DataAPIError.getDataError))
                    return
                }
                
                guard let result = try? JSONDecoder().decode(type, from: data) else {
                    completion(.failure(DataAPIError.wrongDecoding))
                    return
                }
                
                completion(.success(result))
            }
            task.resume()
        }
    }
}
