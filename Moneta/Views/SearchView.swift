import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        List(viewModel.currencies(), id: \.id) { currency in
            Text(currency.name)
        }
            .navigationTitle("coins")
            .modifier(SearchBarModifier(searchBar: viewModel))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
