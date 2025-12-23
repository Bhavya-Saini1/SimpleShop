//
//  Product.swift
//  SimpleShop
//
//  Created by Parth Narkhede on 2025-12-22.
//

import Foundation

struct Product: Identifiable {
    let id: String
    let title: String
    let price: Double
    let retailer: String
    let productURL: URL?
    let imageURL: URL?
}
