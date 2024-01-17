//
//  FavouritePrimesView.swift
//
//
//  Created by Jason Ngo on 2024-01-10.
//

import SwiftUI

struct FavouritePrimesView: View {

    // MARK: - Properties

    @Binding var favourites: [Int]
    @Binding var feed: [AppState.Activity]

    // MARK: - Body

    var body: some View {
        List {
            ForEach(self.favourites, id: \.self) { prime in
                Text("\(prime)")
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach {
                    let prime = self.favourites.remove(at: $0)
                    self.feed.append(.init(type: .removedFavouritePrime(prime)))
                }
            })
        }
        .navigationTitle("Favourite Primes")
    }
}

//#Preview {
//    FavouritePrimesView(favourites: AppState().$favouritePrimes)
//}
