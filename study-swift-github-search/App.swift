import SwiftUI
import ComposableArchitecture

@main
struct GithubSearchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: Store(initialState: CounterFeature.State()) {
                CounterFeature()
              })
        }
    }
}
