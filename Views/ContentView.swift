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
                NavigationLink(destination: FavouritePrimesView(favourites: self.$state.favouritePrimes)) {
                    Text("Favourite Primes")
                }
            }
            .navigationTitle("State Management")
        }
    }
}
