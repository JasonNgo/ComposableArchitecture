//
//  CounterView.swift
//  ComposableArchitecture
//
//  Created by Jason Ngo on 2024-01-10.
//

import SwiftUI

struct CounterView: View {

    // MARK: - Properties

    @ObservedObject var state: AppState

    @State private var nthPrime: PrimeResult?
    @State private var isNthPrimeButtonDisabled = false
    @State private var isCounterModalPresented = false

    // MARK: - Body

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Button(action: { state.count -= 1 }) {
                    Text("-")
                }
                Text("\(state.count)")
                    .foregroundStyle(state.isCountPrime ? .green : .red)
                Button(action: { state.count += 1 }) {
                    Text("+")
                }
            }

            Button {
                self.isCounterModalPresented = true
            } label: {
                Text("Is this prime?")
            }

            Button {
                self.isNthPrimeButtonDisabled = true
                ComposableArchitecture.nthPrime(state.count) { nthPrime in
                    self.nthPrime = nthPrime
                    self.isNthPrimeButtonDisabled = false
                }
            } label: {
                Text("What is the \(self.ordinal(state.count)) prime?")
            }
            .disabled(self.isNthPrimeButtonDisabled)
        }
        .font(.title)
        .navigationTitle("Counter Demo")
        .sheet(isPresented: $isCounterModalPresented, content: {
            CounterModalView(state: state)
        })
        .alert(item: $nthPrime, content: { nthPrime in
            Alert(title: Text("The \(self.ordinal(state.count)) Prime is \(nthPrime.value)"))
        })
    }
}

extension CounterView {
    private func ordinal(_ n: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: n) ?? ""
    }
}

#Preview {
    CounterView(state: AppState())
}
