import SwiftUI

struct ContentView: View {
    var data = DataService()
    var state = StateService()

    init() {
        data.initialize(state: state)
    }

    var body: some View {
        TabView {
            Tab(icon: "chart.pie", label: "portfolio", tag: 0) {
                PortfolioView()
            }
            Tab(icon: "magnifyingglass", label: "coins", tag: 1) {
                SearchView()
            }
            Tab(icon: "gearshape", label: "settings", tag: 1) {
                SettingsView()
            }
        }
            .environmentObject(data)
            .environmentObject(state)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
