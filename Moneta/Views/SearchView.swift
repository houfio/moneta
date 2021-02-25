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
                    Text(viewModel.difference(currency, state: state))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .foregroundColor(Color(.systemBackground))
                        .background(Color(viewModel.positive(currency, state: state) ? .systemGreen : .systemRed))
                        .clipShape(Capsule())
                }
                    .navigationBarItems(trailing: Refresh(loading: data.loading, action: data.refreshCryptocurrencies))
            }
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
