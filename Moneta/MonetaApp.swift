import SwiftUI
import Resolver

@main
struct MonetaApp: App {
    init() {
        Resolver.register {
            StateService()
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
