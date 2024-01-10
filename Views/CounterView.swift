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

    @State private var isCounterModalPresented = false

    // MARK: - Body

    var body: some View {
        VStack {
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

            } label: {
                Text("What is the \(self.ordinal(state.count)) prime?")
            }
        }
        .font(.title)
        .navigationTitle("Counter Demo")
        .sheet(isPresented: $isCounterModalPresented, content: {
            CounterModalView(state: state)
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
