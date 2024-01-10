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

    // MARK: - Body

    var body: some View {
        List {
            ForEach(self.favourites, id: \.self) { prime in
                Text("\(prime)")
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { self.favourites.remove(at: $0) }
            })
        }
        .navigationTitle("Favourite Primes")
    }
}

//#Preview {
//    FavouritePrimesView(favourites: AppState().$favouritePrimes)
//}
