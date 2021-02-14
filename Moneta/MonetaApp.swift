import SwiftUI
import Resolver

@main
struct MonetaApp: App {
    init() {
        Resolver.register {
            StateService()
        }.scope(.application)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
