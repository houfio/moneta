import SwiftUI

struct Tab<Content: View, Style: NavigationViewStyle>: View {
    var icon: String
    var label: LocalizedStringKey
    var tag: Int
    var style: Style
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
            .navigationViewStyle(style)
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            Tab(icon: "house", label: "Home", tag: 0, style: DefaultNavigationViewStyle()) {
                VStack {
                    Text("Hello, World!")
                        .navigationTitle("Navigation")
                    Spacer()
                }
            }
        }
    }
}
