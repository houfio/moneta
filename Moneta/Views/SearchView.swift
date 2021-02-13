import SwiftUI

struct SearchView: View {
    @ObservedObject var searchBar = SearchBar()
    
    var body: some View {
        List {
            ForEach(0..<50, id: \.self) { row in
                Text("Test \(row)")
            }
        }
        .navigationTitle("coins")
        .modifier(SearchBarModifier(searchBar: self.searchBar))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
