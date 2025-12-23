//
//  HomeViewModel.swift
//  SimpleShop
//
//  Created by Parth Narkhede on 2025-12-22.
//

import Foundation
import SwiftUI
import Combine

@MainActor
final class HomeViewModel: ObservableObject {

    @Published var trending: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    private let service: ProductService

    init(service: ProductService) {
        self.service = service
    }

    func loadTrending() async {
        isLoading = true
        errorMessage = nil

        do {
            trending = try await service.fetchTrending()
        } catch {
            trending = []
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
