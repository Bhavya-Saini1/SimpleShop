//
//  HomeView.swift
//  SimpleShop
//
//  Created by Parth Narkhede on 2025-12-22.
//
import SwiftUI

struct HomeView: View {

    @StateObject private var viewModel =
        HomeViewModel(service: MockProductService()) // replace this with API Service

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                } else {
                    List(viewModel.trending) { product in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(product.title)
                                .font(.headline)

                            Text(product.retailer)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)

                            Text("$\(product.price, specifier: "%.2f")")
                                .font(.subheadline)
                                .bold()
                        }
                        .padding(.vertical, 6)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Trending")
        }
        .task {
            await viewModel.loadTrending()
        }
    }
}



/* struct HomeView: View {

    @StateObject private var viewModel =
        HomeViewModel(service: MockProductService())

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView("Loading...")
            } else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            } else {
                Text("Home")
                    .font(.largeTitle)
            }
        }
        .task {
            await viewModel.loadTrending()
        }
    }
}
*/

