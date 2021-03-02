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
                    ListEntry(icon: "sum", label: "symbol", value: "\(listing.symbol)")
                    ListEntry(icon: "number", label: "ranking", value: "\(listing.cmcRank)")
                    ListEntry(icon: "arrow.clockwise", label: "circulating_supply", value: "\(String(format: "%.2f", listing.circulatingSupply))")
                    ListEntry(icon: "arrow.triangle.swap", label: "total_supply", value: "\(String(format: "%.2f", listing.totalSupply))")
                }
                Section(header: Text("portfolio")) {
                    ListEntry(icon: "bag", label: "amount", value: "0") {
                        viewModel.showAmount.toggle()
                    }
                        .sheet(isPresented: $viewModel.showAmount) {
                            AmountSheet(text: $viewModel.amount, listing: listing)
                        }
                }
            }
                .listStyle(InsetGroupedListStyle())
        }
            .navigationTitle(listing.name)
            .onAppear {
                viewModel.initialize(listing, state: state)
            }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(listing: Listing(id: 1, name: "Bitcoin", symbol: "BTC", slug: "bitcoin", cmcRank: 1, numMarketPairs: 1, circulatingSupply: 1, totalSupply: 1, maxSupply: 1, lastUpdated: "", dateAdded: "", tags: [], platform: nil, quote: [:]))
    }
}
