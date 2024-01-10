import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: CounterView()) {
                    Text("Counter Demo")
                }
                NavigationLink(destination: EmptyView()) {
                    Text("Favourite Primes")
                }
            }
            .navigationTitle("State Management")
        }
    }
}

struct CounterView: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Text("-")
                }
                Text("0")
                Button(action: {}) {
                    Text("+")
                }
            }

            Button {

            } label: {
                Text("Is this prime?")
            }

            Button {

            } label: {
                Text("What is the 0th prime?")
            }
        }
        .font(.title)
        .navigationTitle("Counter Demo")
    }
}
