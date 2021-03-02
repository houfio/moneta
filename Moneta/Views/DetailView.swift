import SwiftUI

struct DetailView: View {
    @EnvironmentObject var data: DataService
    @EnvironmentObject var state: StateService
    @ObservedObject var viewModel = ViewModel()
    var listing: Listing

    var body: some View {
        VStack {
            PriceHeader(value: viewModel.price(listing, state: state), change: viewModel.change(listing, state: state))
            List {
                Section(header: Text("info")) {
                    ListEntry(icon: "number", label: "ranking", value: "\(listing.cmcRank)")
                }
                Section(header: Text("portfolio")) {
                    ListEntry(icon: "number", label: "amount", value: "0")
                }
            }
                .listStyle(InsetGroupedListStyle())
        }
            .navigationTitle(listing.name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(listing: Listing(id: 1, name: "Bitcoin", symbol: "BTC", slug: "bitcoin", cmcRank: 1, numMarketPairs: 1, circulatingSupply: 1, totalSupply: 1, maxSupply: 1, lastUpdated: "", dateAdded: "", tags: [], platform: nil, quote: [:]))
    }
}
