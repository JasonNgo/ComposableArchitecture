import SwiftUI

struct ContentView: View {

    // MARK: - Properties

    @ObservedObject var state: AppState

    // MARK: - Body

    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: CounterView(state: state)) {
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
