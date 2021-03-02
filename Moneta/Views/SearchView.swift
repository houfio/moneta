import SwiftUI

struct SearchView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        List(viewModel.listings(data: data), id: \.id) { listing in
            NavigationLink(destination: DetailView(listing: listing)) {
                HStack {
                    Text(listing.name)
                    Spacer()
                    Pill(value: viewModel.change(listing, state: state))
                }
            }
        }
            .listStyle(PlainListStyle())
            .navigationTitle("coins")
            .navigationBarItems(trailing: Refresh(loading: false) {
                data.fetchListings(state: state)
            })
            .modifier(SearchBarModifier(searchBar: viewModel))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
