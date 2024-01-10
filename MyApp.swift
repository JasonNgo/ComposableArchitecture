import SwiftUI

@main
struct MyApp: App {

    @StateObject private var state = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView(state: state)
        }
    }

}
