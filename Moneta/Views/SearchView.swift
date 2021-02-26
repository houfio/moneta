import SwiftUI

struct SearchView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        List(viewModel.currencies(data: data), id: \.id) { currency in
            NavigationLink(destination: DetailView(id: currency.id, name: currency.name)) {
                HStack {
                    Text(currency.name)
                    Spacer()
                    Pill(value: viewModel.change(currency, state: state))
                }
            }
        }
            .listStyle(PlainListStyle())
            .navigationTitle("coins")
            .navigationBarItems(trailing: Refresh(loading: data.loading, action: data.refreshCryptocurrencies))
            .modifier(SearchBarModifier(searchBar: viewModel))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
