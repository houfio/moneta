import SwiftUI

struct SearchView: View {
    @EnvironmentObject var state: StateService
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        List(viewModel.currencies(state: state), id: \.id) { currency in
            NavigationLink(destination: Text(currency.name)) {
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
