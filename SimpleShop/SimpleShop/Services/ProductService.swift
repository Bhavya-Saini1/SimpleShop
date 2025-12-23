//
//  ProductService.swift
//  SimpleShop
//
//  Created by Parth Narkhede on 2025-12-22.
// This is simple sample code until API calls are setup.
//

import Foundation

protocol ProductService {
    func fetchTrending() async throws -> [Product] // this and
    func search(query: String) async throws -> [Product] //    this will make it so that it doesn't matter if its mock data or API data
}

final class MockProductService: ProductService { // this is only used for development/demo products this is temp implementation.
    
    func fetchTrending() async throws -> [Product] {
        return [
            Product(
                id: "amazon-airpods-pro-2",
                title: "AirPods Pro (2nd Gen)",
                price: 249.99,
                retailer: "Amazon",
                productURL: URL(string: "https://www.amazon.com")!,
                imageURL: nil
            ),
            Product(
                id: "bestbuy-xm5",
                title: "Sony WH-1000XM5",
                price: 399.99,
                retailer: "Best Buy",
                productURL: URL(string: "https://www.bestbuy.com")!,
                imageURL: nil
            )
        ]
    }
    
    func search(query: String) async throws -> [Product] {
        let all = try await fetchTrending()
        if query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return all
        }
        return all.filter { $0.title.localizedCaseInsensitiveContains(query) }
    }
}

