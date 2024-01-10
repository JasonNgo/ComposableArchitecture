//
//  CounterModalView.swift
//
//
//  Created by Jason Ngo on 2024-01-10.
//

import SwiftUI

struct CounterModalView: View {

    // MARK: - Properties

    @Environment(\.dismiss) var dismiss
    @ObservedObject var state: AppState

    // MARK: - Body

    var body: some View {
        VStack {
            if state.isCountPrime {
                Text("\(state.count) is a prime number")
                
                if state.favouritePrimes.contains(state.count) {
                    Button(action: {
                        state.favouritePrimes.removeAll(where: { $0 == state.count })
                    }) {
                        Text("Remove from favourite primes")
                    }
                } else {
                    Button(action: {
                        state.favouritePrimes.append(state.count)
                    }) {
                        Text("Add to favourite primes")
                    }
                }
            } else {
                Text("\(state.count) is not a prime number")
            }

        }
    }

}

#Preview {
    CounterModalView(state: AppState())
}
