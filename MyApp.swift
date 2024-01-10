import SwiftUI

@main
struct MyApp: App {

    @ObservedObject private var state = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView(state: state)
        }
    }

}
