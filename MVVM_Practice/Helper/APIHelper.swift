//
//  APIHelper.swift
//  MVVM_Practice
//
//  Created by Shivakumar Harijan on 10/04/24.
//

import UIKit

//typealias creats short form for a long expresions/statments 
typealias Handler = (Result<[Product], DataError>) -> Void

//Singleton Design Pattern
class APIHelper {
    //static allows to use directly without creating object of class
    static let shared = APIHelper()
    private init() {}
    
    func fetchProductList(completion: @escaping Handler) {
        guard let url = URL(string: Constant.API.ProductListURL) else {
            return
        }
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            } catch {
                completion(.failure(.networ(error)))

            }
        }.resume()
    }
}

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case networ(_ error: Error?)
}
