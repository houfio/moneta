import SwiftUI

struct SearchView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService
    @ObservedObject var viewModel = ViewModel()

    var body: some View {
        VStack {
            if let listings = viewModel.listings(data: data) {
                List(listings, id: \.id) { listing in
                    NavigationLink(destination: DetailView(listing: listing)) {
                        HStack {
                            Text(listing.name)
                            Spacer()
                            Pill(value: viewModel.change(listing, state: state))
                        }
                    }
                }
                    .listStyle(PlainListStyle())
                    .modifier(SearchBarModifier(searchBar: viewModel))
            } else {
                ProgressView()
            }
        }
            .navigationTitle("coins")
            .navigationBarItems(trailing: Refresh(loading: data.loading) {
                data.fetchListings(state: state)
            })
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
