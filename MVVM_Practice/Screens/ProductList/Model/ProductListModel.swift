//
//  ProductListModel.swift
//  MVVM_Practice
//
//  Created by Shivakumar Harijan on 10/04/24.
//

import Foundation
// MARK: - WelcomeElement
struct Product: Codable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rating
}
// MARK: - Rating
struct Rating: Codable {
    let rate: Float
    let count: Int
}
