import SwiftUI

struct Tab<Content: View>: View {
    var icon: String
    var label: LocalizedStringKey
    var tag: Int
    let content: () -> Content

    var body: some View {
        NavigationView {
            content()
        }
            .tabItem {
                VStack {
                    Image(systemName: icon)
                    Text(label)
                }
            }
            .tag(tag)
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            Tab(icon: "house", label: "Home", tag: 0) {
                VStack {
                    Text("Hello, World!")
                        .navigationTitle("Navigation")
                    Spacer()
                }
            }
        }
    }
}
